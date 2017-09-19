//
//  TravelListCell.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelListCell: UITableViewCell, TravelListCellInterface {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var previewImage: UIImageView!
    
    weak var travelListCellDelegate: TravelListCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initWithTravelData(data: TravelListCellViewModel) {
        self.usernameLabel.text = data.username()
        self.descriptionLabel.text = data.travelDescription()
    }

}
