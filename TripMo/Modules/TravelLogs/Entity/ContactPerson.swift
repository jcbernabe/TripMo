//
//  ContactPerson.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class ContactPerson: Object {
    
    /**
        Name of contact person or Name of resort
     */
    dynamic var name = ""
    
    /**
        Contact number 
        *Landline or Mobile*
     */
    dynamic var contactNumber = ""
    
    /**
        Email address of person, company or resort
     */
    dynamic var email = ""
    
    /**
        Website of company or resort
     */
    dynamic var website = ""
    
}
