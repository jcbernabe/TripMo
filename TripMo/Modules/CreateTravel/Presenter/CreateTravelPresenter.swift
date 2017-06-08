//
//  CreateTravelPresenter.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation

class CreateTravelPresenter: NSObject, CreateTravelPresenterInterface, CreateTravelInteractorDelegate {
    
    weak var createTravelPresenterDelegate: CreateTravelPresenterDelegate?
    
// MARK: - Create Travel Interactor Delegate Methods
    func postSuccessful() {
        
    }
    
    func postFailed(error: Error) {
        
    }
    
}
