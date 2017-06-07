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
            
            beforeEach {
                loginVC = LoginViewController()
                loginVC.regPassTF.text = "test"
                loginVC.regConfirmPassTF.text = "test"
            }
            
            it("confirms password") {
                let passwordMatch = loginVC.confirmPassword()
                
                expect(passwordMatch).to(beTrue())
            }
            
        }
    }
}
