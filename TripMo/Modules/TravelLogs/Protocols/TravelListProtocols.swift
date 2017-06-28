//
//  TravelListProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

/// Travel Logs interactor functions and variables
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

/// Travel Logs interactor delegate or output functions
protocol TravelLogsInteractorDelegate: class {
    
    /**
        Interactor delegate to execute if fetching travel logs is successful.
     */
    func fetchTravelLogsSuccessful(items: Results<Travel>)
    
    /**
        Interactor delegate to execute if fetching travel logs failed.
     
        - Parameter error: Fetch failed error description.
     */
    func fetchTravelLogsFailedWithErrors(error: Error)
    
}

/// Travel Logs presenter functions and variables
protocol TravelLogsPresenterInterface {
    
    /**
        Presenter delegate varaible
     */
    weak var travelLogsPresenterDelegate: TravelLogsPresenterDelegate? {get set}
    
    /**
        Presenter function to handle fetching of all travel logs.
     */
    func handleFetchTravelLogs()
}

/// Travel Logs presenter delegate or output functions
protocol TravelLogsPresenterDelegate: class {
    
    /**
        Presenter delegate function to execute on View Controller for presenting fetched data.
        - Parameter items: *Array* of **TravelListCellViewModel** object containing details of each travel logs.
     */
    func presentTravelLogsData(items: Array<TravelListCellViewModel>)
    
}

/// Travel List Cell Interface
protocol TravelListCellInterface {
    
    /**
        Travel List Cell delegate varaible
     */
    weak var travelListCellDelegate: TravelListCellDelegate? {get set}
    
    /**
        Travel List Cell data initializer method.
        - Parameter data: *TravelListCellViewModel* object that contains all details needed to populate view objects with necessary data.
    */
    func initWithTravelData(data: TravelListCellViewModel)
}

/// Travel List Cell delegate functions
protocol TravelListCellDelegate: class {
    
}
