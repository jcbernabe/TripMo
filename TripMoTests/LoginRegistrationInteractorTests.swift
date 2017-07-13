//
//  LoginRegistrationInteractorTests.swift
//  TripMo
//
//  Created by Hanet on 6/21/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import XCTest
import Quick
import Nimble
import RealmSwift
@testable import TripMo

class LoginRegistrationInteractorTests: QuickSpec {
    
    override func spec() {
        describe("Login Registration Interactor") {
            
            var interactor: LoginRegistrationInteractor!
            let username = "test"
            let password = "test"
            
            var realm: Realm!
            
            beforeEach {
                interactor = LoginRegistrationInteractor()
                realm = try! Realm()
            }
            
            it("login") {
                interactor.loginUserWith(username: username, password: password)
            }
            
            it("register") {
                interactor.registerUserWith(username: username, password: password)
            }
            
        }
    }
}
