//
//  LoginPresenter.swift
//  TripMo
//
//  Created by Hanet on 6/2/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

/**
    Login Presenter Class
 
    - Pass all user inputted data from View Controller to Login Interactor.
    - Process all needed outputs(ex. *UIAlertController*..).
 */
class LoginPresenter: NSObject, LoginInteractorDelegate, LoginPresenterInterface {

    weak var loginPresenterDelegate: LoginPresenterDelegate?
    
    var loginRegistrationInteractor: LoginRegistrationInteractor
    
    override init() {
        self.loginRegistrationInteractor = LoginRegistrationInteractor()
        
        super.init()
        
        self.loginRegistrationInteractor.loginInteractorDelegate = self
    }
    
    func handleLoginWith(username: String, password: String) {
        loginRegistrationInteractor.loginUserWith(username: username, password: password)
    }
    
    func handleRegistrationWith(username: String, password: String) {
        loginRegistrationInteractor.registerUserWith(username: username, password: password)
    }
    
// MARK: - Login Interactor Delegates
    
    func loginSuccessful() {
        loginPresenterDelegate?.showLoginRegistrationSuccessfulTransition()
    }
    
    func loginFailedWithError(errorText: String, isRegister: Bool) {
    
        var titleString = ""
        
        if isRegister {
            titleString = "Registration Error"
        } else {
            titleString = "Login Error"
        }
        
        let alert = UIAlertController(title: titleString, message: errorText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        loginPresenterDelegate?.showLoginRegistrationErrorAlert(alert: alert)
    }
    
}
