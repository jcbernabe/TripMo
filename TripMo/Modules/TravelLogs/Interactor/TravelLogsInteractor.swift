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
        
        self.realm = RealmManager.sharedInstance.globalRealm
        
//        guard let results = self.realm.objects(Travel.self) else {
//            print("There are no travel logs")
//            return
//        }
        
        let results = self.realm.objects(Travel.self)
        
        print(results)
        self.travelLogs = results
     
        self.travelLogsInteractorDelegate?.fetchTravelLogsSuccessful(items: self.travelLogs!)
//        self.travelLogsInteractorDelegate?.fetchTravelLogsFailedWithErrors(error: Error())
        
    }
}
