//
//  LoginPresenter.swift
//  TripMo
//
//  Created by Hanet on 6/2/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class LoginPresenter: NSObject, LoginInteractorDelegate, LoginPresenterInterface {

    weak var loginPresenterDelegate: LoginPresenterDelegate?
    
    var loginInteractor: LoginInteractor
    
    override init() {
        self.loginInteractor = LoginInteractor()
        
        super.init()
        
        self.loginInteractor.loginInteractorDelegate = self
    }
    
    func handleLoginWith(username: String, password: String) {
        
    }
    
// MARK: - Login Interactor Delegates
    
    func loginSuccessful() {
        
    }
    
    func loginFailed() {
        
    }
    
}
