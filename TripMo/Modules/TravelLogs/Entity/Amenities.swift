//
//  Amenities.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

/**
    Basic amenities found on houses or rooms accomodation.
 */
enum AmenitiesSelection: String {
    /// Privately occupied room.
    case PrivateRoom = "Private Room"
    /// Shared occupancy.
    case SharedRoom = "Shared Room"
    /// Private bathroom for room.
    case PrivateBath = "Private Bath"
    /// Shared or common bathroom.
    case SharedBath = "Shared Bath"
    /// Airconditioning unit available.
    case Aircon = "Aircon"
    /// Fan unit available.
    case Fan = "Fan"
    /// Room has own television.
    case Television = "Television"
    /// Room has own refrigerator
    case Refrigerator = "Refrigerator"
    /// House has own dining area.
    case DiningArea = "Dining Area"
    /// House has own living room.
    case LivingArea = "Living Area"
    /// House has own kitchen area.
    case Kitchen = "Kitchen"
    /// Resort has its own parking area.
    case ParkingSpace = "Parking Space"
    /// Resort have a basketball court.
    case BasketballCourt = "Basketball Court"
    /// Resort have an area for playing table tennis.
    case TableTennis = "Table Tennis"
    /// Resort have a volleyball court.
    case VolleyballArea = "Volleyball Area"
    /// Resort has its own restaurant.
    case Restaurant = "Restaurant"
    /// Resort have a swimming pool.
    case SwimmingPool = "Swimming Pool"
    /// Resort have an infinity pool.
    case InfinityPool = "Infinity Pool"
}

/**
    Object that contains details about resort, house or room amenities.
 */
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
