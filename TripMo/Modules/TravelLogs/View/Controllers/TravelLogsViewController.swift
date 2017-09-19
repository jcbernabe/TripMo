//
//  TravelLogsViewController.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class TravelLogsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,TravelLogsPresenterDelegate {

    @IBOutlet weak var travelListTable: UITableView!
    
    let travelLogsPresenter = TravelLogsPresenter()
    
    var travelData: Array<TravelListCellViewModel> = []
    
    var selectedIdx: NSIndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travelLogsPresenter.travelLogsPresenterDelegate = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchTravelLogs()
    }
    
// MARK: - Fetch Travel Logs
    
    func fetchTravelLogs() {
        travelLogsPresenter.handleFetchTravelLogs()
    }
    
// MARK: - Travel Logs Presenter Delegates
    
    func presentTravelLogsData(items: Array<TravelListCellViewModel>) {
        self.travelData = items;
        self.travelListTable.reloadData()
    }

// MARK: - UITableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.travelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelListCell", for: indexPath) as! TravelListCell
        
        cell.initWithTravelData(data: self.travelData[indexPath.row])
        
        cell.selectionStyle = .none
        
        return cell;
    }
    
// MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIdx = indexPath as NSIndexPath
        
        self.performSegue(withIdentifier: "ShowTravelView", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowTravelView" {
            let vc = segue.destination as! TravelViewController
            vc.title = "Location Name"
            
            let travelCellVM = TravelViewCellModel(travelData: self.travelData[(selectedIdx?.row)!].travelData)
            vc.travelViewCellModel = travelCellVM
        }
    }
}
