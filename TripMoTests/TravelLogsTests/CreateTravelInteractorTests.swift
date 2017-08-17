//
//  CreateTravelInteractorTests.swift
//  TripMo
//
//  Created by Hanet on 7/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

@testable import TripMo

class CreateTravelInteractorTests: QuickSpec {
    
    override func spec() {
        describe("Create Travel Interactor") {
            
            var testRealm: Realm!
            var createTravelInteractor: MockCreateTravelInteractor!
            
            beforeEach {
                testRealm = try! Realm()
                
                try! testRealm.write {
                    testRealm.deleteAll()
                }
                
                createTravelInteractor = MockCreateTravelInteractor(realm: testRealm)
                
            }
            
            afterEach {
                try! testRealm.write {
                    testRealm.deleteAll()
                }
            }
            
            it("adds a travel log") {
                expect(testRealm.objects(Travel.self).count).to(equal(0))
                
                let travel = Travel()
                travel.location = "testLocation"
                createTravelInteractor .createTravelPost(data: travel)
                
                expect(testRealm.objects(Travel.self).count).to(beGreaterThan(0))
            }
        }
    }
}

class MockCreateTravelInteractor: CreateTravelInteractorInterface
{
    weak var createTravelInteractorDelegate: CreateTravelInteractorDelegate?
    
    let realm: Realm!
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    convenience init() {
        self.init(realm: try! Realm())
    }
    
    func createTravelPost(data: Travel) {
        
        do {
            try realm?.write {
                realm?.add(data)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
