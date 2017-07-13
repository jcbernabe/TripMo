//
//  CreateTravelInteractor.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class CreateTravelInteractor: NSObject, CreateTravelInteractorInterface {
    
    weak var createTravelInteractorDelegate: CreateTravelInteractorDelegate?
    
    var realm: Realm?
    
    func createTravelPost(data: Travel) {
        postTravel(travel: data)
    }
    
    private func postTravel(travel: Travel) {
//        let newTravelLog = Travel()
//        
//        newTravelLog.username = "test username"
//        newTravelLog.travelDescription = "test description"
//        
//        newTravelLog.location = "test location"
//        
//        newTravelLog.accomodationName = "test accomodation name"
//        newTravelLog.houseAmenities = "test house amenities"
//        newTravelLog.resortAmenities = "test resort amenities"
//        
//        newTravelLog.activities = "test activities"
//        
//        let contactPerson = ContactPerson()
//        contactPerson.name = "test name"
//        contactPerson.contactNumber = "123456"
//        
//        newTravelLog.contactPerson = contactPerson
//        
//        newTravelLog.dateOfTravel = NSDate()
        
        realm = RealmManager.sharedInstance.globalRealm
        
        travel.username = CurrentUser.sharedInstance.username()
        
        do {
            try realm?.write {
                realm?.add(travel)
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
    
}




