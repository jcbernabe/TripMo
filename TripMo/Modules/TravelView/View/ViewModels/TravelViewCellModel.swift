//
//  TravelViewCellModel.swift
//  TripMo
//
//  Created by Hanet on 8/21/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

struct TravelViewCellModel {
    
    // Travel data from Travel list
    let travelData: Travel
    
    let dateFormatter = DateFormatter()
    
    init(travelData: Travel) {
        self.travelData = travelData
        
        dateFormatter.dateFormat = "MMMM"
    }
    
    
// MARK: - Accomodation Details
    
    /*
        Name of place that accomodated the stay of the user.
        - Returns: *String* value for the name of accomodation
     */
    func accomodationName() -> String {
        return self.travelData.accomodationName
    }
    
    /*
        All listed amenities set by user on travel log creation.
        - Returns: Comma-seperated values of all amenities
     */
    func amenities() -> String {
        // TODO: - Implement array joining values. For Amenities array.
        
        return self.travelData.amenities
    }
    
    /*
        All listed activities set by user on travel log creation
        - Returns: Comma-seperated values of all activities
     */
    func activities() -> String {
        // TODO: - Implement array joining values. For Activities array.
        
        return self.travelData.activities
    }
    
// MARK: - Contact Details 
    
    /*
        Details of contact person.
        - Returns: *Tuple* of all important details of contact person
     */
    func contactDetails() -> (name: String, contactNumber: String, email: String, website: String) {
        return ((self.travelData.contactPerson?.name)!,
                (self.travelData.contactPerson?.contactNumber)!,
                (self.travelData.contactPerson?.email)!,
                (self.travelData.contactPerson?.website)!)
    }
    
// MARK: - Other Details
    
    /*
        Travel date.
        - Returns: *String* formatted date of travel
     */
    func travelDate() -> String {
        return self.dateFormatter.string(from: self.travelData.dateOfTravel)
    }
    
    /*
        Optional off-season dates.
        - Returns: *Tuple* of off-season formatted date *String* of travel
     */
    func offSeasonDates() -> (offSeasonStart: String, offSeasonEnd: String) {
        
        let offSeasonStart = self.dateFormatter.string(from: self.travelData.offSeasonDateStart)
        let offSeasonEnd = self.dateFormatter.string(from: self.travelData.offSeasonDateFinish)
        
        return (offSeasonStart,
                offSeasonEnd)
    }
    
    /*
        Optional peak-season dates.
        - Returns: *Tuple* of peak-season formatted date *String* of travel
     */
    func peakSeasonDates() -> (peakSeasonStart: String, peakSeasonEnd: String) {
        
        let peakSeasonStart = self.dateFormatter.string(from: self.travelData.peakSeasonDateStart)
        let peakSeasonEnd = self.dateFormatter.string(from: self.travelData.peakSeasonDateFinish)
        
        return (peakSeasonStart,
                peakSeasonEnd)
    }
    
    /*
        Optional Travel description or comments..
        - Returns: Travel description
     */
    func travelDesciption() -> String {
        return self.travelData.additionalComments
    }
}


//dynamic var username: String = ""
//dynamic var travelDescription: String = ""
//
//dynamic var location: String = ""
//
//dynamic var accomodationName: String = ""
//dynamic var amenities: String = ""
//
//dynamic var activities: String = ""
//
////dynamic var photos: String = ""
//
//dynamic var contactPerson: ContactPerson?
//
//dynamic var dateOfTravel = Date()
//
//dynamic var offSeasonDateStart = Date()
//dynamic var offSeasonDateFinish = Date()
//
//dynamic var peakSeasonDateStart = Date()
//dynamic var peakSeasonDateFinish = Date()
//
//dynamic var additionalComments: String = ""
//
//dynamic var isFavorite: Bool = false
