//
//  PopupController.swift
//  TripMo
//
//  Created by Hanet on 9/18/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class PopupController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var isAmenities: Bool = true
    
    var amenitiesList: [AmenitiesSelection] = []
    var activitiesList: [ActivityType] = []
    var sourceArray: Array<Any>?
    
    var selectionsArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(PopupListCell.self, forCellReuseIdentifier: "cell")
        
        amenitiesList = [.PrivateRoom,.SharedRoom,.PrivateBath,.SharedBath,.Aircon,.Fan,.Television,.Refrigerator,.DiningArea,.LivingArea,.Kitchen,.ParkingSpace,.BasketballCourt,.TableTennis,.VolleyballArea,.Restaurant,.SwimmingPool,.InfinityPool]
        
        activitiesList = [.UndefinedActivity,.BananaBoat,.BeachVolleyball,.BikeTrail,.Bonfire,.Camping,.CityTour,.Hiking,.IslandHopping,.MuseumTour,.Paragliding,.Spelunking,.Snorkeling,.ScubaDiving,.TeamBuilding,.Trekking,.Zipline]
        
        tableView.allowsMultipleSelection = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    func popupSelectedValues() -> (values: [String], isAmenities: Bool) {
        return (selectionsArray, isAmenities)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isAmenities {
            return amenitiesList.count
        } else {
            return activitiesList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PopupListCell
        
        if isAmenities {
            cell.textLabel?.text = amenitiesList[indexPath.row].rawValue
        } else {
            cell.textLabel?.text = activitiesList[indexPath.row].rawValue
        }
        
        cell.textLabel?.font = UIFont(name: "AvenirNext-Regular", size: 13)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isAmenities {
            selectionsArray.append(amenitiesList[indexPath.row].rawValue)
        } else {
            selectionsArray.append(activitiesList[indexPath.row].rawValue)
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if isAmenities {
            if let index = selectionsArray.index(where: {$0 == "\((amenitiesList[indexPath.row].rawValue))"}) {
                selectionsArray.remove(at: index)
            }
        } else {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class PopupListCell: UITableViewCell
{
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.contentView.backgroundColor = UIColor.lightGray
        } else {
            self.contentView.backgroundColor = UIColor.white
        }
    }
}
