//
//  Activities.swift
//  TripMo
//
//  Created by Hanet on 6/30/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

/**
    Typical activities while travelling or on a vacation trip.
 */
enum ActivityType: String {
    ///
    case UndefinedActivity = "Undefined"
    /// Bananaboat water activity.
    case BananaBoat = "Banana Boat"
    /// Beach volleyball.
    case BeachVolleyball = "Beach Volleyball"
    /// Ride your bike through trails.
    case BikeTrail = "Bike Trail"
    /// Setup bonfires.
    case Bonfire = "Bonfire"
    /// Camp.
    case Camping = "Camping"
    /// Tour city landmarks and destinations.
    case CityTour = "City Tour"
    /// Hike.
    case Hiking = "Hiking"
    /// Island hopping.
    case IslandHopping = "Island Hopping"
    /// Tour museums.
    case MuseumTour = "Museum Tour"
    /// Paragliding.
    case Paragliding = "Paragliding"
    /// Spelunking.
    case Spelunking = "Spelunking"
    /// Snorkeling.
    case Snorkeling = "Snorkeling"
    /// Scuba diving.
    case ScubaDiving = "Scuba Diving"
    /// Team building activities.
    case TeamBuilding = "Team Building"
    /// Trekking.
    case Trekking = "Trekking"
    /// Zipline.
    case Zipline = "Zipline"
}

/**
    Object that contains details about usual activities that can be done while travelling or having a vacation trip.
 */
class Activities: Object {
    
    var activityType: ActivityType = .UndefinedActivity
    
}
