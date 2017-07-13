//
//  ViewController.swift
//  TripMo
//
//  Created by Hanet on 4/17/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginPresenterDelegate {
    
// MARK: - Login Views Outlet

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginUnameTF: UITextField!
    @IBOutlet weak var loginPassTF: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var createAcctBtn: UIButton!
    @IBOutlet weak var forgotPassBtn: UIButton!
    
// MARK: - Registration Views Outlet
    
    @IBOutlet weak var registrationView: UIView!
    @IBOutlet weak var regUnameTF: UITextField!
    @IBOutlet weak var regPassTF: UITextField!
    @IBOutlet weak var regConfirmPassTF: UITextField!
    @IBOutlet weak var regCreateBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    let loginPresenter = LoginPresenter()
    
// MARK: - View Loaders
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginPresenter.loginPresenterDelegate = self
        loginPresenter.handleLoginWith(username: "testuserfive", password: "testuserfive")
    }
    
// MARK: - IBAction Selector Methods - Login
    
    /// Handle action from tapping login button.
    @IBAction func loginTapped(_ sender: Any) {
        self.view.endEditing(true)
        
        loginPresenter.handleLoginWith(username: loginUnameTF.text!, password: loginPassTF.text!)
    }
    
    /// Handle action from tapping create account button in login view.
    @IBAction func loginCreateAcctTapped(_ sender: Any) {
        self.view.endEditing(true)
        
        self.view.sendSubview(toBack: loginView)
        self.view.bringSubview(toFront: registrationView)
    }
    
    /// Handle action from tapping forgot password button.
    @IBAction func forgotPassTapped(_ sender: Any) {
        self.view.endEditing(true)
        
    }

// MARK: - IBAction Selector Methods - Registration

    /// Handle action from tapping create account button in registration view.
    @IBAction func registrationCreateAcctTapped(_ sender: Any) {
        self.view.endEditing(true)
        
        if confirmPassword() == false {
            DispatchQueue.main.async {
                let alertController = UIAlertController(title: "YEAH!", message: "Login Success", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
            return;
        }
        
        loginPresenter.handleRegistrationWith(username: regUnameTF.text!, password: regConfirmPassTF.text!)
    }
    
    /// Handle action from tapping cancel button.
    @IBAction func cancelTapped(_ sender: Any) {
        self.view.endEditing(true)
        
        self.view.sendSubview(toBack: registrationView)
        self.view.bringSubview(toFront: loginView)
    }
    
// MARK: - Login Presenter Delegates
    
    func showLoginRegistrationSuccessfulTransition() {
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "ShowTravelLogs", sender: self)
        }
    }
    
    func showLoginRegistrationErrorAlert(alert: UIAlertController) {
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
// MARK: - Confirm Password
    
    /**
        Function to check if password and confirm password fields have the same value
     
        - Returns: *true* if passwords match and *false* if passwords don't match
     */
    func confirmPassword() -> Bool {
        
        if regPassTF.text! != regConfirmPassTF.text! {
            return false
        }
        
        return true
    }
}

