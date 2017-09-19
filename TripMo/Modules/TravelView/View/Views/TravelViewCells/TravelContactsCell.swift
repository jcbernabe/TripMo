//
//  TravelContactsCell.swift
//  TripMo
//
//  Created by Hanet on 8/18/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelContactsCell: UITableViewCell, TravelViewCellInterface {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contactNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showWithTravelData(travelData: TravelViewCellModel) {
        nameLabel.text = travelData.contactDetails().name
        contactNumberLabel.text = travelData.contactDetails().contactNumber
        emailLabel.text = travelData.contactDetails().email
        websiteLabel.text = travelData.contactDetails().website
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
