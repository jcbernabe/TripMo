//
//  ViewController.swift
//  TripMo
//
//  Created by Hanet on 4/17/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
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
    @IBOutlet weak var regEmailTF: UITextField!
    @IBOutlet weak var regCreateBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
// MARK: - View Loaders
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
// MARK: - IBAction Selector Methods - Login
    
    /// Handle action from tapping login button.
    @IBAction func loginTapped(_ sender: Any) {
        
    }
    
    /// Handle action from tapping create account button in login view.
    @IBAction func loginCreateAcctTapped(_ sender: Any) {
        
    }
    
    /// Handle action from tapping forgot password button.
    @IBAction func forgotPassTapped(_ sender: Any) {
        
    }

// MARK: - IBAction Selector Methods - Registration

    /// Handle action from tapping create account button in registration view.
    @IBAction func registrationCreateAcctTapped(_ sender: Any) {
        
    }
    
    /// Handle action from tapping cancel button.
    @IBAction func cancelTapped(_ sender: Any) {
        
    }
}

