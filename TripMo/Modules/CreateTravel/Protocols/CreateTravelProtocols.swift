//
//  CreateTravelProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import UIKit

/// Create Travel interactor functions and variables
protocol CreateTravelInteractorInterface {
    
    /**
        Create Travel interactor delegate variable.
     */
    weak var createTravelInteractorDelegate: CreateTravelInteractorDelegate? {get set}
    
    /**
        Interactor method to create Travel log with the given data.
        - Parameter data: Travel object containing all log details.
     */
    func createTravelPost(data: Travel)
}

/// Create Travel interactor delegate functions
protocol CreateTravelInteractorDelegate: class {
    
    /**
        Interactor delegate method to execute when posting a travel log is successful.
     */
    func postSuccessful()
    
    /**
        Interactor delegate method to execute when posting a travel log fails.
        - Parameter error: Error object containing error description of failed post.
     */
    func postFailed(error: Error)
    
}

/// Create Travel presenter functions and variables
protocol CreateTravelPresenterInterface {
    
    /**
        Create Travel presenter delegate variable.
     */
    weak var createTravelPresenterDelegate: CreateTravelPresenterDelegate? {get set}
    
    /**
        Presenter method to receive travel log data from *CreateTravelViewController* to be passed to the Interactor function.
        - Parameter data: Travel object containing all log details.
     */
    func handleCreatingTravelPost(data: Travel)
}

/// Create Travel presenter delegate functions
protocol CreateTravelPresenterDelegate: class {
    
    /**
        Presenter delegate method to execute when posting a travel log is successful. Execute any prompt to show successful posting on delegate View Controller.
     */
    func showSuccessfulPost()
    
    /**
     Presenter delegate method to execute when posting a travel log is successful. Execute any prompt to show failed posting on delegate View Controller.
        - Parameter alertController: *UIAlertController* object to be presented on View Controller containing error details.
     */
    func showFailedPost(alertController: UIAlertController)
    
}

/// Create Travel cells interface
protocol CreateTravelCellInterface {
    
    /**
        Create Travel cell delegate variable
     */
    weak var createTravelCellDelegate: CreateTravelCellDelegate? {get set}
    
    //func initCreateTravelCell(atIndex: IndexPath)
    
}

/// Create Travel cells delegate functions
protocol CreateTravelCellDelegate: class {
    
    func presentPopup(isAmenities: Bool)
    
}

/// Location cell data source functions
protocol LocationCellDataSource: class {
    
    /**
        Data source function for getting location cell data.
        - Returns: Location name
     */
    func locationCellData() -> String
}

/// Accomodation cell data source functions
protocol AccomodationCellDataSource: class {
    
    /**
        Data source function for getting accomodation cell data.
        - Returns: A *tuple* with name, amenities and activities.
     */
    func accomodationCellData() -> (name: String, amenities: String, activities: String)
}

/// Photos cell data source functions
protocol PhotosCellDataSource: class {
    
    /**
        Data source function for getting photo cell data.
        - Returns: An *array* of ***UIImage*** objects
     */
    func photosCellData() -> [UIImage]
}

/// Contact person cell data source functions
protocol ContactPersonCellDataSource: class {
    
    /**
        Data source function for getting contact person cell data.
        - Returns: A **ContactPerson** object
     */
    func contactPersonCellData() -> ContactPerson
}

/// Other details cell data source functions
protocol OtherDetailsCellDataSource: class {
    /**
        Data source function for getting contact person cell data.
        - Returns: A *tuple* with travelDate, offSeasonStart, offSeasonEnd, peakSeasonStart, peakSeasonEnd and comments.
     */
    func otherDetailsCellData() -> (travelDate: Date, offSeasonStart: Date, offSeasonEnd: Date, peakSeasonStart: Date, peakSeasonEnd: Date, comments: String)
}



