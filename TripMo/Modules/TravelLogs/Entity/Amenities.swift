//
//  Amenities.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

enum HouseAmenities: Int {
    case PrivateRoom
    case SharedRoom
    case PrivateBath
    case SharedBath
    case Aircon
    case Fan
    case Television
    case Refrigerator
    case DiningArea
    case LivingArea
    case Kitchen
}

class Amenities: Object {
    
    dynamic var id: Int = 0
    
    
//    dynamic var houseAmenities
//    var houseAmenities: HouseAmenities {
//        get {
//            return houseAmenities(rawValue: )!
//        }
//        set {
//            
//        }
//    }
    
}
