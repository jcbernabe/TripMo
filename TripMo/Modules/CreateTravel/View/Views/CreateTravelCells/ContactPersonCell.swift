//
//  ContactPersonCell.swift
//  TripMo
//
//  Created by Hanet on 7/10/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class ContactPersonCell: UITableViewCell, CreateTravelCellInterface, ContactPersonCellDataSource {
    
    weak var createTravelCellDelegate: CreateTravelCellDelegate?

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var contactNumberField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var websiteField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

// MARK: - Contact Person Data Source
    func contactPersonCellData() -> ContactPerson {
        
        let contactPerson = ContactPerson()
        contactPerson.name = self.nameField.text!
        contactPerson.contactNumber = self.contactNumberField.text!
        contactPerson.email = self.emailField.text!
        contactPerson.website = self.websiteField.text!
        
        return contactPerson
    }
    
}
