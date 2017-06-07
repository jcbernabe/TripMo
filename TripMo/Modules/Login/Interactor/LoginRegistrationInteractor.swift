//
//  LoginRegistrationInteractor.swift
//  TripMo
//
//  Created by Hanet on 6/2/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit
import RealmSwift

class LoginRegistrationInteractor: NSObject, LoginRegistrationInteractorInterface {
    
    weak var loginInteractorDelegate: LoginInteractorDelegate?
    
    var realm: Realm!
    
    func loginUserWith(username: String, password: String) {
        performLoginRegisterProcess(username: username, password: password, isRegister: false)
    }
    
    func registerUserWith(username: String, password: String) {
        performLoginRegisterProcess(username: username, password: password, isRegister: true)
    }
    
    /**
        Perform Login or Registration process
     
        Parameter username:   username input
        Parameter password:   password input
        Parameter email:      email input
        Parameter isRegister: **true** if action is to register **false** if login
     */
    private func performLoginRegisterProcess(username: String, password: String, isRegister: Bool) {
        
        let syncCredentials = SyncCredentials.usernamePassword(username: username, password: password, register: isRegister)
        
        SyncUser.logIn(with: syncCredentials, server: URL(string: "http://127.0.0.1:9080")!, timeout: 60) { (user, error) in
            
            guard let user = user else {
                self.loginInteractorDelegate?.loginFailedWithError(errorText: (error?.localizedDescription)!, isRegister: isRegister)
                return;
            }
            
            DispatchQueue.main.async {
                
                let theUrl = URL(string: "realm://127.0.0.1:9080/~/\(username)/listings")!
                
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: theUrl)
                )
                self.realm = try! Realm(configuration: configuration)
                
                let permissionChange = SyncPermissionChange(realmURL: theUrl.absoluteString,    // The remote Realm URL on which to apply the changes
                    userID: "*",       // The user ID for which these permission changes should be applied
                    mayRead: true,     // Grant read access
                    mayWrite: false,    // Grant write access
                    mayManage: false)  // Grant management access
                
                self.loginInteractorDelegate?.loginSuccessful()
            }
        }
    }
}
