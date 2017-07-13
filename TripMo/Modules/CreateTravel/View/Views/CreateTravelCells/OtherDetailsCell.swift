//
//  OtherDetailsCell.swift
//  TripMo
//
//  Created by Hanet on 7/10/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class OtherDetailsCell: UITableViewCell, CreateTravelCellInterface, OtherDetailsCellDataSource {
    
    weak var createTravelCellDelegate: CreateTravelCellDelegate?

    @IBOutlet weak var dateOfTravelLabel: UILabel!
    
    @IBOutlet weak var offSeasonStartLabel: UILabel!
    @IBOutlet weak var offSeasonEndLabel: UILabel!
    
    @IBOutlet weak var peakSeasonStartLabel: UILabel!
    @IBOutlet weak var peakSeasonEndLabel: UILabel!
    
    @IBOutlet weak var commentsTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
// MARK: - Other Details Data Source
    func otherDetailsCellData() -> (travelDate: Date, offSeasonStart: Date, offSeasonEnd: Date, peakSeasonStart: Date, peakSeasonEnd: Date, comments: String) {
        return (Date(), Date(), Date(), Date(), Date(), self.commentsTextView.text!)
    }
    
// MARK: - UIButton Selectors
    @IBAction func showDatePickerTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            break
        case 1:
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
        
    }
}
