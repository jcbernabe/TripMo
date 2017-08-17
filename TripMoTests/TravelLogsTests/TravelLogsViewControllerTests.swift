//
//  TravelLogsViewControllerTests.swift
//  TripMo
//
//  Created by Hanet on 7/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Quick
import Nimble
import RealmSwift

@testable import TripMo

class TravelLogsViewControllerTests: QuickSpec {
   
    override func spec() {
        describe("Travel Logs View Controller") {
            
            var testRealm: Realm!
            
            var travelLogsViewController: TravelLogsViewController!
            
            beforeEach {
                RealmManager.sharedInstance.openLocalRealm()
                testRealm = RealmManager.sharedInstance.localRealm
                
                travelLogsViewController = UIStoryboard(name: "TravelLogs", bundle: nil).instantiateViewController(withIdentifier: "TravelLogsViewController") as! TravelLogsViewController
                let _ = travelLogsViewController.view
            }
            
            it("fetches added data") {
                
                let travel = Travel()
                travel.location = "testLocation"
                
                try! testRealm.write {
                    testRealm.add(travel)
                }
                
                travelLogsViewController.fetchTravelLogs()
                let travelModel = travelLogsViewController.travelData[0] 
                let travelData = travelModel.travelData
                
                expect(travelData.location).to(equal(travel.location))
            }
            
        }
    }
}

class MockTravelLogsViewController: UIViewController, TravelLogsPresenterDelegate
{
    var travelListTable: UITableView!
    var travelData: Array<TravelListCellViewModel> = []
    
    var travelLogsPresenter: MockTravelLogsPresenter!
    var realm: Realm!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.travelLogsPresenter = MockTravelLogsPresenter(realm: self.realm)
        travelLogsPresenter.travelLogsPresenterDelegate = self
    }
 
    func fetchTravels() {
        travelLogsPresenter.handleFetchTravelLogs()
    }
    
    func presentTravelLogsData(items: Array<TravelListCellViewModel>) {
        self.travelData = items;
    }
}


class MockTravelLogsPresenter: NSObject, TravelLogsPresenterInterface, TravelLogsInteractorDelegate {
    
    weak var travelLogsPresenterDelegate: TravelLogsPresenterDelegate?
    
    var travelLogsInteractor: MockTravelLogsInteractor?
    
    override init() {
        super.init()
        
        self.travelLogsInteractor?.travelLogsInteractorDelegate = self
    }
    
    init(realm: Realm) {
        super.init()
        
        travelLogsInteractor = MockTravelLogsInteractor(realm: realm)
        travelLogsInteractor?.travelLogsInteractorDelegate = self
    }
    
    func handleFetchTravelLogs() {
        travelLogsInteractor?.fetchTravelLogs()
    }
    
    // MARK: - Travel Logs Interactor Delegates
    
    func fetchTravelLogsSuccessful(items: Results<Travel>) {
        
        var viewModelArray = [TravelListCellViewModel]()
        
        for travel in items {
            let travelLogViewModel = TravelListCellViewModel(travelData: travel)
            viewModelArray.append(travelLogViewModel)
        }
        
        self.travelLogsPresenterDelegate?.presentTravelLogsData(items: viewModelArray)
    }
    
    func fetchTravelLogsFailedWithErrors(error: Error) {
        
    }
    
}

class MockTravelLogsInteractor: NSObject, TravelLogsInteractorInterface {
    
    weak var travelLogsInteractorDelegate: TravelLogsInteractorDelegate?
    
    var realm: Realm!
    
    var travelLogs: Results<Travel>?
    
    init(realm: Realm) {
        self.realm = realm
    }
    
    func fetchTravelLogs() {

        let results = self.realm.objects(Travel.self)
        
        print(results)
        self.travelLogs = results
        
        self.travelLogsInteractorDelegate?.fetchTravelLogsSuccessful(items: self.travelLogs!)
    }
}
