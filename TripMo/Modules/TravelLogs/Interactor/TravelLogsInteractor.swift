//
//  TravelLogsInteractor.swift
//  TripMo
//
//  Created by Hanet on 6/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit
import RealmSwift

class TravelLogsInteractor: NSObject, TravelLogsInteractorInterface {
    
    weak var travelLogsInteractorDelegate: TravelLogsInteractorDelegate?
    
    var realm: Realm!
    
    var travelLogs: Results<Travel>?
    
    func fetchTravelLogs() {
        
        self.realm = RealmManager.sharedInstance.localRealm
        
        guard let synchroRealm = RealmManager.sharedInstance.synchroRealm else {
            self.travelLogs = self.realm.objects(Travel.self)
            self.travelLogsInteractorDelegate?.fetchTravelLogsSuccessful(items: self.travelLogs!)
            
            print("There is no synchro Realm")
            return
        }
        
        let results = synchroRealm.objects(Travel.self)
        
        self.travelLogs = results
        self.travelLogsInteractorDelegate?.fetchTravelLogsSuccessful(items: self.travelLogs!)
//        self.travelLogsInteractorDelegate?.fetchTravelLogsFailedWithErrors(error: Error())
        
    }
}
