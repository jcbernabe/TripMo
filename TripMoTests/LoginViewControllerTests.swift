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
            
            it("confirms password match") {
                loginVC.regPassTF.text = "test"
                loginVC.regConfirmPassTF.text = "test"
                
                let passwordMatch = loginVC.confirmPassword()
                expect(passwordMatch).to(beTrue())
            }
            
            it("confirms password don't match") {
                loginVC.regPassTF.text = "test"
                loginVC.regConfirmPassTF.text = "testy"
                
                let passwordMatch = loginVC.confirmPassword()
                expect(passwordMatch).to(beFalse())
            }
            
        }
    }
}
