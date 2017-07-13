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
enum AmenitiesSelection {
    /// Privately occupied room.
    case PrivateRoom
    /// Shared occupancy.
    case SharedRoom
    /// Private bathroom for room.
    case PrivateBath
    /// Shared or common bathroom.
    case SharedBath
    /// Airconditioning unit available.
    case Aircon
    /// Fan unit available.
    case Fan
    /// Room has own television.
    case Television
    /// Room has own refrigerator
    case Refrigerator
    /// House has own dining area.
    case DiningArea
    /// House has own living room.
    case LivingArea
    /// House has own kitchen area.
    case Kitchen
    /// Resort has its own parking area.
    case ParkingSpace
    /// Resort have a basketball court.
    case BasketballCourt
    /// Resort have an area for playing table tennis.
    case TableTennis
    /// Resort have a volleyball court.
    case VolleyballArea
    /// Resort has its own restaurant.
    case Restaurant
    /// Resort have a swimming pool.
    case SwimmingPool
    /// Resort have an infinity pool.
    case InfinityPool
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
