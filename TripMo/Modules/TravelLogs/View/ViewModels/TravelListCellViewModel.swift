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
    
    init(travelData: Travel) {
        self.travelData = travelData
    }
    
    func username() -> String {
        return self.travelData.username
    }
    
    func travelDescription() -> String {
        return self.travelData.travelDescription
    }
}
