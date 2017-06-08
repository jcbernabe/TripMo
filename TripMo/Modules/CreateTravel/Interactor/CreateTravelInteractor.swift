//
//  CreateTravelInteractor.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class CreateTravelInteractor: NSObject, CreateTravelPresenterInterface {
    
    weak var createTravelPresenterDelegate: CreateTravelPresenterDelegate?
    
    var realm: Realm?
    
    private func postTravel() {
        let newTravelLog = Travel()
        
        newTravelLog.username = "test username"
        newTravelLog.travelDescription = "test description"
        
        newTravelLog.location = "test location"
        
        newTravelLog.accomodationName = "test accomodation name"
        newTravelLog.houseAmenities = "test house amenities"
        newTravelLog.resortAmenities = "test resort amenities"
        
        newTravelLog.activities = "test activities"
        
        let contactPerson = ContactPerson()
        contactPerson.name = "test name"
        contactPerson.contactNumber = "123456"
        
        newTravelLog.contactPerson = contactPerson
        
        newTravelLog.dateOfTravel = NSDate()
        
    }
    
}
