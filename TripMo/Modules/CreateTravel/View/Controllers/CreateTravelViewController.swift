//
//  CreateTravelViewController.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class CreateTravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CreateTravelPresenterDelegate {

    @IBOutlet weak var createTravelTable: UITableView!
    
    let createTravelPresenter = CreateTravelPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTravelPresenter.createTravelPresenterDelegate = self
    }

// MARK: - Post Travel Tapped
    
    @IBAction func postTravelTapped(_ sender: Any) {
        
    }
    
// MARK: - Create Travel Presenter Delegate Methods
    
    func showSuccessfulPost() {
        
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
            return 3
        case 2:
            return 1
        case 3:
            return 1
        case 4:
            return 4
        case 5:
            return 3
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelListCell", for: indexPath)
        
        return cell;
    }
    
// MARK: - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
