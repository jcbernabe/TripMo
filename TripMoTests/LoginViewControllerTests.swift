//
//  LoginViewControllerTests.swift
//  TripMo
//
//  Created by Hanet on 4/17/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import XCTest
import Quick
import Nimble
import RealmSwift
@testable import TripMo

class LoginViewControllerTests: QuickSpec {
    
    override func spec() {
        describe("Login View Controller") {
            
            var loginVC: LoginViewController!
            var storyboard: UIStoryboard!
            
            beforeEach {
                storyboard = UIStoryboard(name: "Login", bundle: nil)
                
                loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                let _ = loginVC.view
                
            }
            
            describe("registration password matching") {
                
                beforeEach {
                    loginVC.regPassTF.text = ""
                    loginVC.regConfirmPassTF.text = ""
                }
                
                it("matches") {
                    loginVC.regPassTF.text = "test"
                    loginVC.regConfirmPassTF.text = "test"
                    
                    let passwordMatch = loginVC.confirmPassword()
                    expect(passwordMatch).to(beTrue())
                }
                
                it("does not match") {
                    loginVC.regPassTF.text = "test"
                    loginVC.regConfirmPassTF.text = "testy"
                    
                    let passwordMatch = loginVC.confirmPassword()
                    expect(passwordMatch).to(beFalse())
                }
            }
            
            
            describe("Login Process") {
                
                let loginPrenster = MockLoginPresenter()
          
                it("logins successfully") {
                    loginPrenster.handleLoginWith(username: "test", password: "test")
                    
                    expect(loginPrenster.loginSuccess).to(beTrue())
                }
                
                it("fails login process") {
                    loginPrenster.handleLoginWith(username: "test", password: "testing")
                    
                    expect(loginPrenster.loginSuccess).to(beFalse())
                }
            }
            
        }
    }
}

class MockLoginPresenter: LoginPresenterInterface, LoginInteractorDelegate {
    
    weak var loginPresenterDelegate: LoginPresenterDelegate?
    
    let loginInteractor = MockLoginInteractor()
    var loginSuccess = false
    
    func handleLoginWith(username: String, password: String) {
        loginInteractor.loginInteractorDelegate = self
        
        loginInteractor.loginUserWith(username: username, password: password)
    }
    
    func handleRegistrationWith(username: String, password: String) {
        loginInteractor.loginInteractorDelegate = self
        
        loginInteractor.registerUserWith(username: username, password: password)
    }
    
    func loginSuccessful() {
        loginSuccess = true
    }
    
    func loginFailedWithError(errorText: String, isRegister: Bool) {
        loginSuccess = false
    }
}

