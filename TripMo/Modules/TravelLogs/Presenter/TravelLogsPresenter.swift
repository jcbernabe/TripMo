//
//  TravelLogsPresenter.swift
//  TripMo
//
//  Created by Hanet on 6/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit
import RealmSwift

class TravelLogsPresenter: NSObject, TravelLogsPresenterInterface, TravelLogsInteractorDelegate {
    
    weak var travelLogsPresenterDelegate: TravelLogsPresenterDelegate?
    
    let travelLogsInteractor = TravelLogsInteractor()
    
    override init() {
        super.init()
        
        self.travelLogsInteractor.travelLogsInteractorDelegate = self
    }
    
    func handleFetchTravelLogs() {
        travelLogsInteractor.fetchTravelLogs()
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
