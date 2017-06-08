//
//  Travel.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class Travel: Object {
    
    dynamic var username: String = ""
    dynamic var travelDescription: String = ""
    
    dynamic var location: String = ""
    
    dynamic var accomodationName: String = ""
    dynamic var houseAmenities: String = ""
    dynamic var resortAmenities: String = ""
    
    dynamic var activities: String = ""
    
    //dynamic var photos: String = ""
    
    dynamic var contactPerson: ContactPerson?
    
    dynamic var dateOfTravel = NSDate()
    
    dynamic var offSeasonDateStart = NSDate()
    dynamic var offSeasonDateFinish = NSDate()
    
    dynamic var peakSeasonDateStart = NSDate()
    dynamic var peakSeasonDateFinish = NSDate()
    
    dynamic var additionalComments: String = ""
    
}
