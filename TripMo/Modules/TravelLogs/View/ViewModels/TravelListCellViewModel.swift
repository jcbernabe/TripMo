//
//  TravelListCellViewModel.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation

struct TravelListCellViewModel {
    
    let travelData: Travel
    
    let username: String
    let travelDescription: String
    
    init(travelData: Travel) {
        self.travelData = travelData
        
        self.username = travelData.username
        self.travelDescription = travelData.travelDescription
    }
    
}
