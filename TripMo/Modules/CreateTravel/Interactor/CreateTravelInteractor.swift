//
//  CreateTravelInteractor.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class CreateTravelInteractor: NSObject, CreateTravelInteractorInterface {
    
    weak var createTravelInteractorDelegate: CreateTravelInteractorDelegate?
    
    var realm: Realm?
    
    func createTravelPost(data: Travel) {
        postTravel(travel: data)
    }
    
    private func postTravel(travel: Travel) {
        
        guard let synchroRealm = RealmManager.sharedInstance.synchroRealm else {
            return;
        }
        
        realm = synchroRealm
        
        travel.username = CurrentUser.sharedInstance.username()
        
        do {
            try realm?.write {
                realm?.add(travel)
                
                createTravelInteractorDelegate?.postSuccessful()
            }
        } catch let error {
            print(error.localizedDescription)
            createTravelInteractorDelegate?.postFailed(error: error)
        }
        
    }
    
}




