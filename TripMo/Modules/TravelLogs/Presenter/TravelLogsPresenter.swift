//
//  TravelLogsPresenter.swift
//  TripMo
//
//  Created by Hanet on 6/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

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
    
    func fetchTravelLogsSuccessful() {
        
    }
    
    func fetchTravelLogsFailedWithErrors(error: Error) {
        
    }
    
}
