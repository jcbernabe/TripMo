//
//  TravelAccomodationCell.swift
//  TripMo
//
//  Created by Hanet on 8/18/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelAccomodationCell: UITableViewCell {

    @IBOutlet weak var mainHolderView: UIView!
    
    @IBOutlet weak var accomodationLabel: UILabel!
    @IBOutlet weak var amenitiesLabel: UILabel!
    @IBOutlet weak var activitiesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainHolderView.layer.cornerRadius = 5.0;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
