//
//  TravelViewController.swift
//  TripMo
//
//  Created by Hanet on 8/18/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelViewController: UIViewController {
    
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
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelAccomodationCell", for: indexPath)
        
        return cell
    }
}

extension TravelViewController: UITableViewDelegate {
    
}
