//
//  TravelOtherDetailsCell.swift
//  TripMo
//
//  Created by Hanet on 8/18/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelOtherDetailsCell: UITableViewCell, TravelViewCellInterface {

    @IBOutlet weak var travelDateLabel: UILabel!
    
    @IBOutlet weak var offSeasonStartLabel: UILabel!
    @IBOutlet weak var offSeasonEndLabel: UILabel!
    
    @IBOutlet weak var peakSeasonStartLabel: UILabel!
    @IBOutlet weak var peakSeasonEndLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showWithTravelData(travelData: TravelViewCellModel) {
        travelDateLabel.text = travelData.travelDate()
        
        offSeasonStartLabel.text = travelData.offSeasonDates().offSeasonStart
        offSeasonEndLabel.text = travelData.offSeasonDates().offSeasonEnd

        peakSeasonStartLabel.text = travelData.peakSeasonDates().peakSeasonStart
        peakSeasonEndLabel.text = travelData.peakSeasonDates().peakSeasonEnd
        
        commentsLabel.text = travelData.travelDesciption()
    }
    
}
