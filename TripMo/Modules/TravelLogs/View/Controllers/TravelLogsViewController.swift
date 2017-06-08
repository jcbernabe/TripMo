//
//  TravelLogsViewController.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelLogsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var travelListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

// MARK: - UITableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelListCell", for: indexPath)
        
        return cell;
    }
    
// MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
