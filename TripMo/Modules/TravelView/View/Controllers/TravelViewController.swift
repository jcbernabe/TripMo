//
//  TravelViewController.swift
//  TripMo
//
//  Created by Hanet on 8/18/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController {
    
    var travelViewCellModel: TravelViewCellModel!
    
    @IBOutlet weak var travelDetailsTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCells()
        
        self.travelDetailsTable.estimatedRowHeight = 100.0
        self.travelDetailsTable.rowHeight = UITableViewAutomaticDimension
    }
    
    func registerCells() {
        travelDetailsTable.register(UINib(nibName: "TravelPhotosCell", bundle: nil), forCellReuseIdentifier: "TravelPhotosCell")
        travelDetailsTable.register(UINib(nibName: "TravelAccomodationCell", bundle: nil), forCellReuseIdentifier: "TravelAccomodationCell")
        travelDetailsTable.register(UINib(nibName: "TravelActivitiesCell", bundle: nil), forCellReuseIdentifier: "TravelActivitiesCell")
        travelDetailsTable.register(UINib(nibName: "TravelContactsCell", bundle: nil), forCellReuseIdentifier: "TravelContactsCell")
        travelDetailsTable.register(UINib(nibName: "TravelOtherDetailsCell", bundle: nil), forCellReuseIdentifier: "TravelOtherDetailsCell")
    }
}

extension TravelViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCell(toTableView: tableView, atIndex: indexPath)
    }
    
    func generateCellIdentifierAtIndex(indexPath: IndexPath) -> String {
        
        var identifier = ""
        
        switch indexPath.row {
        case 0: identifier = "TravelPhotosCell"
        case 1: identifier = "TravelAccomodationCell"
        case 2: identifier = "TravelContactsCell"
        case 3: identifier = "TravelOtherDetailsCell"
            
        default:
            break
        }
        
        return identifier
    }
    
    func createCell(toTableView: UITableView, atIndex: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        let cellIdentifier = generateCellIdentifierAtIndex(indexPath: atIndex)
        
//        cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex) as TravelViewCellInterface
//        cell.showWithTravelData(travelData: travelViewCellModel)
        
        switch atIndex.row {
        case 0:
            cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex)
           
            
        case 1:
            let accomodationCell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex) as! TravelAccomodationCell
            accomodationCell.showWithTravelData(travelData: travelViewCellModel)
            cell = accomodationCell

        case 2:
            let contactsCell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex) as! TravelContactsCell
            contactsCell.showWithTravelData(travelData: travelViewCellModel)
            cell = contactsCell
            
        case 3:
            let otherDetailsCell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex) as! TravelOtherDetailsCell
            otherDetailsCell.showWithTravelData(travelData: travelViewCellModel)
            cell = otherDetailsCell
            
        default:
            break
        }
        
        cell.selectionStyle = .none
        return cell
    }
}

extension TravelViewController: UITableViewDelegate {
    
}
