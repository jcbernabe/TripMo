//
//  AccomodationCell.swift
//  TripMo
//
//  Created by Hanet on 7/10/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class AccomodationCell: UITableViewCell, CreateTravelCellInterface, AccomodationCellDataSource {

    weak var createTravelCellDelegate: CreateTravelCellDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var amenitiesLabel: UILabel!
    @IBOutlet weak var activitiesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// MARK: - Accomodation Data Source
    func accomodationCellData() -> (name: String, amenities: String, activities: String) {
        return (self.nameField.text!, self.amenitiesLabel.text!, self.activitiesLabel.text!)
    }
    
// MARK: - UIButton Selectors
    @IBAction func addAmenitiesTapped(_ sender: Any) {
        
    }
    
    @IBAction func addActivitiesTapped(_ sender: Any) {
        
    }
    
}
