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
enum ActivityType {
    ///
    case UndefinedActivity
    /// Bananaboat water activity.
    case BananaBoat
    /// Beach volleyball.
    case BeachVolleyball
    /// Ride your bike through trails.
    case BikeTrail
    /// Setup bonfires.
    case Bonfire
    /// Camp.
    case Camping
    /// Tour city landmarks and destinations.
    case CityTour
    /// Hike.
    case Hiking
    /// Island hopping.
    case IslandHopping
    /// Tour museums.
    case MuseumTour
    /// Paragliding.
    case Paragliding
    /// Spelunking.
    case Spelunking
    /// Snorkeling.
    case Snorkeling
    /// Scuba diving.
    case ScubaDiving
    /// Team building activities.
    case TeamBuilding
    /// Trekking.
    case Trekking
    /// Zipline.
    case Zipline
}

/**
    Object that contains details about usual activities that can be done while travelling or having a vacation trip.
 */
class Activities: Object {
    
    var activityType: ActivityType = .UndefinedActivity
    
}
