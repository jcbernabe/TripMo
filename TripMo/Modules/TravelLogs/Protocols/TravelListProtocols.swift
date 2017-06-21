//
//  TravelListProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation

/// Travel Logs interactor methods and variables
protocol TravelLogsInteractorInterface {
    
    /**
        Travel Logs interactor delegate variable
     */
    weak var travelLogsInteractorDelegate: TravelLogsInteractorDelegate? {get set}
    
    /**
        Interactor method to fetch all travel logs from ROS (*Realm Object Server*)
     */
    func fetchTravelLogs()
}

/// Travel Logs interactor delegate or output methods
protocol TravelLogsInteractorDelegate: class {
    
    /**
        Interactor delegate to execute if fetching travel logs is successful.
     */
    func fetchTravelLogsSuccessful()
    
    /**
        Interactor delegate to execute if fetching travel logs failed.
     
        - Parameter error: Fetch failed errors.
     */
    func fetchTravelLogsFailedWithErrors(error: Error)
    
}

/// Travel Logs presenter methods and variables
protocol TravelLogsPresenterInterface {
    
    weak var travelLogsPresenterDelegate: TravelLogsPresenterDelegate? {get set}
    
    func handleFetchTravelLogs()
}

/// Travel Logs presenter delegate or output methods
protocol TravelLogsPresenterDelegate: class {
    
}

// MARK: - Travel List Cell Interface

protocol TravelListCellInterface {
    
    weak var travelListCellDelegate: TravelListCellDelegate? {get set}
    
    func initWithTravelData()
}

protocol TravelListCellDelegate: class {
    
}
