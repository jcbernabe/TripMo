//
//  TravelListProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation

// MARK: - Travel List Cell Interface

protocol TravelListCellInterface {
    
    weak var travelListCellDelegate: TravelListCellDelegate? {get set}
    
    func initWithTravelData()
}

protocol TravelListCellDelegate: class {
    
}
