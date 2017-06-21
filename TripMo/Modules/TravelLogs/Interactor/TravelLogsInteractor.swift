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
    
    var travelLogs = List<Travel>()
    
    func fetchTravelLogs() {
        
        self.realm = RealmManager.sharedInstance.globalRealm
        
        guard let results = self.realm.objects(TravelsList.self).first  else {
            print("There are no travel logs")
            return
        }
        
        print(results)
        self.travelLogs = results.travels
     
//        self.travelLogsInteractorDelegate?.fetchTravelLogsSuccessful()
//        self.travelLogsInteractorDelegate?.fetchTravelLogsFailedWithErrors(error: Error())
        
    }
}
