//
//  LoginPresenterTests.swift
//  TripMo
//
//  Created by Hanet on 7/6/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Quick
import Nimble
@testable import TripMo

class LoginPresenterTests: QuickSpec {
    
    override func spec() {
        describe("Login Presenter") {
            
            let loginInteractor = MockLoginInteractor()
            
            beforeEach {
                loginInteractor.loginUsername = ""
                loginInteractor.loginPassword = ""
                
                loginInteractor.registerUsername = ""
                loginInteractor.registerPassword = ""
            }
            
            it("Logins successfully") {
                loginInteractor.loginUserWith(username: "test", password: "test")
                expect(loginInteractor.loginUsername).to(equal("test"))
            }
            
            it("Fails login") {
                loginInteractor.loginUserWith(username: "test", password: "test")
                expect(loginInteractor.loginUsername).toNot(equal("testing"))
            }
            
            it("Registers successfully") {
                loginInteractor.registerUserWith(username: "test", password: "test")
                expect(loginInteractor.registerUsername).to(equal("test"))
            }
            
            it("Fails registration") {
                loginInteractor.registerUserWith(username: "test", password: "test")
                expect(loginInteractor.registerUsername).toNot(equal("testing"))
            }
        }
    }
}

class MockLoginInteractor: LoginRegistrationInteractorInterface {
    weak var loginInteractorDelegate: LoginInteractorDelegate?
    
    var loginUsername: String!
    var loginPassword: String!
    
    var registerUsername: String!
    var registerPassword: String!
    
    func loginUserWith(username: String, password: String) {
        loginUsername = username
        loginPassword = password
        
        if loginUsername! == loginPassword! {
            loginInteractorDelegate?.loginSuccessful()
        } else {
            loginInteractorDelegate?.loginFailedWithError(errorText: "Login Error", isRegister: false)
        }
    }
    
    func registerUserWith(username: String, password: String) {
        registerUsername = username
        registerPassword = password
    }
    
}
