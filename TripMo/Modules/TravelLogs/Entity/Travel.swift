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
    dynamic var amenities: String = ""
    
    dynamic var activities: String = ""
    
    //dynamic var photos: String = ""
    
    dynamic var contactPerson: ContactPerson?
    
    dynamic var dateOfTravel = Date()
    
    dynamic var offSeasonDateStart = Date()
    dynamic var offSeasonDateFinish = Date()
    
    dynamic var peakSeasonDateStart = Date()
    dynamic var peakSeasonDateFinish = Date()
    
    dynamic var additionalComments: String = ""
    
    dynamic var isFavorite: Bool = false
    
}
