//
//  LocationSearchCell.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class LocationSearchCell: UITableViewCell, CreateTravelCellInterface, LocationCellDataSource {

    weak var createTravelCellDelegate: CreateTravelCellDelegate?
    
    @IBOutlet weak var locationField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

// MARK: - Create necessary cell objects
    func initCreateTravelCell(atIndex: IndexPath) {
        
    }
    
// MARK: - Location Data Source
    func locationCellData() -> String {
        return self.locationField.text!
    }
    
}
