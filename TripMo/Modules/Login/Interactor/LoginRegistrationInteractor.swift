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
        Private interactor function to perform Login or Registration process
     
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
                
                let theUrl = URL(string: "realm://127.0.0.1:9080/~/\(username)/travels")!
                
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: theUrl)
                )
                
                do {
                    try RealmManager.sharedInstance.openSynchronizedRealmWith(configuration: configuration)
                } catch let error {
                    self.loginInteractorDelegate?.loginFailedWithError(errorText: error.localizedDescription, isRegister: isRegister)
                }
                
                self.loginInteractorDelegate?.loginSuccessful()
            }
        }
    }
}
