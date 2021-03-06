//
//  CreateTravelViewController.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit
import PopupDialog

class CreateTravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateTravelPresenterDelegate, CreateTravelCellDelegate {

    @IBOutlet weak var createTravelTable: UITableView!
    
    var popup: PopupDialog?
    
    weak var locationCellDataSource: LocationCellDataSource?
    weak var accomodationCellDataSource: AccomodationCellDataSource?
    weak var photosCellDataSource: PhotosCellDataSource?
    weak var contactPersonCellDataSource: ContactPersonCellDataSource?
    weak var otherDetailsCellDataSource: OtherDetailsCellDataSource?
    
    // Cell Identifiers
    let locationCellIdentifier = "LocationSearchCell"
    let photoCellIdentifier = "PhotosCell"
    let contactPersonCellIdentifier = "ContactPersonCell"
    let otherDetailsCellIdentifier = "OtherDetailsCell"
    let accomodationCellIdentifier = "AccomodationCell"
    
    let createTravelPresenter = CreateTravelPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTravelPresenter.createTravelPresenterDelegate = self
        
        registerCells()
        
        createTravelTable.estimatedRowHeight = 100;
        createTravelTable.rowHeight = UITableViewAutomaticDimension
    }
    
// MARK: - Register UITableView Cells
    func registerCells() {
        createTravelTable.register(UINib(nibName: locationCellIdentifier, bundle: nil), forCellReuseIdentifier: locationCellIdentifier)
        createTravelTable.register(UINib(nibName: accomodationCellIdentifier, bundle: nil), forCellReuseIdentifier: accomodationCellIdentifier)
        createTravelTable.register(UINib(nibName: photoCellIdentifier, bundle: nil), forCellReuseIdentifier: photoCellIdentifier)
        createTravelTable.register(UINib(nibName: contactPersonCellIdentifier, bundle: nil), forCellReuseIdentifier: contactPersonCellIdentifier)
        createTravelTable.register(UINib(nibName: otherDetailsCellIdentifier, bundle: nil), forCellReuseIdentifier: otherDetailsCellIdentifier)
    }

// MARK: - Post Travel Tapped
    
    @IBAction func postTravelTapped(_ sender: Any) {
    
        let travelData = Travel()
        
        if self.locationCellDataSource != nil {
            travelData.location = (self.locationCellDataSource?.locationCellData())!
        }
        
        if self.accomodationCellDataSource != nil {
            travelData.accomodationName = (self.accomodationCellDataSource?.accomodationCellData().name)!
            travelData.amenities = (self.accomodationCellDataSource?.accomodationCellData().amenities)!
            travelData.activities = (self.accomodationCellDataSource?.accomodationCellData().activities)!
        }
        
        if self.contactPersonCellDataSource != nil {
            travelData.contactPerson = self.contactPersonCellDataSource?.contactPersonCellData()
        }
        
        if self.otherDetailsCellDataSource != nil {
            travelData.offSeasonDateStart = (self.otherDetailsCellDataSource?.otherDetailsCellData().offSeasonStart)!
            travelData.offSeasonDateFinish = (self.otherDetailsCellDataSource?.otherDetailsCellData().offSeasonEnd)!
            
            travelData.peakSeasonDateStart = (self.otherDetailsCellDataSource?.otherDetailsCellData().peakSeasonStart)!
            travelData.peakSeasonDateFinish = (self.otherDetailsCellDataSource?.otherDetailsCellData().peakSeasonEnd)!
            
            travelData.travelDescription = (self.otherDetailsCellDataSource?.otherDetailsCellData().comments)!
        }

        createTravelPresenter.handleCreatingTravelPost(data: travelData)
    }
    
// MARK: - Create Travel Cell Delegate
    
    func presentPopup(isAmenities: Bool) {
        
        let popupController = PopupController(nibName: "PopupController", bundle: nil)
        popupController.isAmenities = isAmenities
        
        popup = PopupDialog(viewController: popupController, buttonAlignment: .horizontal, transitionStyle: .bounceUp, gestureDismissal: true)
        
        let cancelButton = CancelButton(title: "Cancel", height: 40) {
            
        }
        
        let doneButton = DefaultButton(title: "Done", height: 40) {
            self.popupSelectedValues(values: popupController.popupSelectedValues().values, isAmenities: popupController.popupSelectedValues().isAmenities)
        }
        
        popup?.addButtons([cancelButton, doneButton])
        
        present(popup!, animated: true, completion: nil)
    }
    
    func popupSelectedValues(values: [String], isAmenities: Bool) {
        
        popup?.dismiss()
        
        let cell = createTravelTable.cellForRow(at: IndexPath(row: 0, section: 2)) as! AccomodationCell
        
        let stringValue = values.joined(separator: ",")
        
        if isAmenities {
            cell.amenitiesLabel.text = "\(stringValue)"
        } else {
            cell.activitiesLabel.text = "\(stringValue)"
        }

        createTravelTable.reloadData()
    }
    
// MARK: - Create Travel Presenter Delegate Functions
    
    func showSuccessfulPost() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func showFailedPost(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
// MARK: - UITableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 1
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return createCell(toTableView: tableView, atIndex: indexPath);
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = Bundle.main.loadNibNamed("CreateTravelTableHeader", owner: self, options: nil)?[0] as! CreateTravelTableHeader
        
        if section == 3 {
            view.headerNameLabel.text = "Contact Person"
        }
        
        if section == 4 {
            view.headerNameLabel.text = "Other details"
        }
        
        switch section {
        case 3,4:
            return view
            
        default:
            return nil
            
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 3,4:
            return 30.0
            
        default:
            return 0.0
            
        }
    }
    
// MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
// MARK: - Helper Methods
    
    func generateCellIdentifierAtIndex(indexPath: IndexPath) -> String {
        
        var identifier = ""
        
        switch indexPath.section {
        case 0: identifier = locationCellIdentifier
        case 1: identifier = photoCellIdentifier
        case 2: identifier = accomodationCellIdentifier
        case 3: identifier = contactPersonCellIdentifier
        case 4: identifier = otherDetailsCellIdentifier
            
        default:
            break
        }
        
        return identifier
    }
    
    func createCell(toTableView: UITableView, atIndex: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        let cellIdentifier = generateCellIdentifierAtIndex(indexPath: atIndex)
        
        switch atIndex.section {
        case 0:
            cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex)
            self.locationCellDataSource = cell as? LocationCellDataSource
            
        case 1:
            cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex)
            self.photosCellDataSource = cell as? PhotosCellDataSource
            
        case 2:
            cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex)
            let accomodationCell = cell as! AccomodationCell
            accomodationCell.createTravelCellDelegate = self
            self.accomodationCellDataSource = cell as? AccomodationCellDataSource
            
        case 3:
            cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex)
            self.contactPersonCellDataSource = cell as? ContactPersonCellDataSource
            
        case 4:
            cell = toTableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: atIndex)
            self.otherDetailsCellDataSource = cell as? OtherDetailsCellDataSource
            
        default:
            break
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
}
