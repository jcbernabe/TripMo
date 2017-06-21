//
//  TravelsList.swift
//  TripMo
//
//  Created by Hanet on 6/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class TravelsList: Object {
    
    dynamic var id = ""
    
    let travels = List<Travel>()
    
    override static func primaryKey() -> String {
        return "id"
    }
    
}
