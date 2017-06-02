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
    
    weak var loginPresenterDelegate: LoginPresenterDelegate? {get set}
    
    /**
        Event method to call to handle login from view controller actions.
     
        - Parameter username: user input value from username field in login screen
        - Parameter password: user input value from password field in login screen
     */
    func handleLoginWith(username: String, password: String)
}

/// Login presenter delegate or output methods
protocol LoginPresenterDelegate: class {
    func showLoginSuccessfulTransition()
    func showLoginErrorAlert(alert: UIAlertController)
}

/// Login interactor methods and variables
protocol LoginInteractorInterface {
    
    weak var loginInteractorDelegate: LoginInteractorDelegate? {get set}
}

/// Login interactor delegate or output methods
protocol LoginInteractorDelegate: class {
    func loginSuccessful()
    func loginFailed()
}

