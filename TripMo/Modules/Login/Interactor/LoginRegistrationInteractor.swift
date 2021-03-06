//
//  LoginRegistrationInteractor.swift
//  TripMo
//
//  Created by Hanet on 6/2/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit
import RealmSwift

/**
    Login Registration Interactor Class
 
    Handles login and registration actions
    
    - Handle **SyncUser** login, then create a **Realm.Configuration** object to be passed to *RealmManager* class for creating a synchronized *Realm*.
    - Execute login interactor delegate functions if login or registration process succeeds or fails.
 */
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
        
        if SyncUser.all.count != 0 {
            SyncUser.current?.logOut()
        }
        
        let syncCredentials = SyncCredentials.usernamePassword(username: username, password: password, register: isRegister)
        
        SyncUser.logIn(with: syncCredentials, server: URL(string: TripMoRealmConstants.localURL)!, timeout: 60) { (user, error) in
            
            guard let user = user else {
                self.loginInteractorDelegate?.loginFailedWithError(errorText: (error?.localizedDescription)!, isRegister: isRegister)
                return;
            }
            
            DispatchQueue.main.async {
                
                //let theUrl = URL(string: "realm://127.0.0.1:9080/~/\(username)/travels")!
                let theUrl = URL(string: "realm://\(TripMoRealmConstants.localHost)/TripMo/travels")!
                
                let configuration = Realm.Configuration(
                    syncConfiguration: SyncConfiguration(user: user, realmURL: theUrl)
                )
                
                do {
                    try RealmManager.sharedInstance.openSynchronizedRealmWith(configuration: configuration, user: user)
                } catch let error {
                    self.loginInteractorDelegate?.loginFailedWithError(errorText: error.localizedDescription, isRegister: isRegister)
                }
                
                CurrentUser.sharedInstance.currentUsername = username
                self.loginInteractorDelegate?.loginSuccessful()
            }
        }
    }
}
