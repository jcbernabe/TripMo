//
//  LoginProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/2/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import UIKit

/// Login presenter methods and variables
protocol LoginPresenterInterface {
    
    /**
        Login presenter delegate variable.
     */
    weak var loginPresenterDelegate: LoginPresenterDelegate? {get set}
    
    /**
        Event method to call to handle login from view controller actions.
        - Parameter username: user input value from username field in login screen
        - Parameter password: user input value from password field in login screen
     */
    func handleLoginWith(username: String, password: String)
    
    /**
     Event method to call to handle registration from view controller actions.
     - Parameter username: user input value from username field in registration screen
     - Parameter password: user input value from password field in registration screen
     - Parameter email:    user input value from email field in registration screen
     */
    func handleRegistrationWith(username: String, password: String)
}

/// Login presenter delegate or output methods
protocol LoginPresenterDelegate: class {
    
    /**
        Presenter delegate method to execute to notify view controller when login process is successful.
     */
    func showLoginRegistrationSuccessfulTransition()
    
    /**
        Presenter delegate method to execute when login process failed and present error on the view controller.
        - Parameter alert: UIAlertController to be presented that contains error message.
     */
    func showLoginRegistrationErrorAlert(alert: UIAlertController)
}

/// Login interactor methods and variables
protocol LoginRegistrationInteractorInterface {
    
    /**
        Login interactor delegate variable.
     */
    weak var loginInteractorDelegate: LoginInteractorDelegate? {get set}
    
    /**
        Login Interactor method to handle login process
        Parameter username: user input value of username
        Parameter password: user input value of password
     */
    func loginUserWith(username: String, password: String)
    
    /**
        Login Interactor method to handle registration process
        Parameter username: user input value of username
        Parameter password: user input value of password
        Parameter email:    user input value of email
     */
    func registerUserWith(username: String, password: String)
}

/// Login interactor delegate or output methods
protocol LoginInteractorDelegate: class {
    
    /**
        Interactor delegate method to execute when login process is successful.
     */
    func loginSuccessful()
    
    /**
        Interactor delegate method to execute when login process failed.
        
        Parameter errorText: Returned error string from login or registration process
        Parameter isRegister: **true** if action is to register **false** if login
     */
    func loginFailedWithError(errorText: String, isRegister: Bool)
}

