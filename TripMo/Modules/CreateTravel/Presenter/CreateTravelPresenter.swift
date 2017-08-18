//
//  CreateTravelPresenter.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import UIKit

class CreateTravelPresenter: NSObject, CreateTravelPresenterInterface, CreateTravelInteractorDelegate {
    
    weak var createTravelPresenterDelegate: CreateTravelPresenterDelegate?
    
    let createTravelInteractor = CreateTravelInteractor()
    
    override init() {
        super.init()
        
        self.createTravelInteractor.createTravelInteractorDelegate = self
    }
    
// MARK: - Handle Travel Post Creation
    func handleCreatingTravelPost(data: Travel) {
        createTravelInteractor.createTravelPost(data: data)
    }
    
// MARK: - Create Travel Interactor Delegate Methods
    func postSuccessful() {
        createTravelPresenterDelegate?.showSuccessfulPost()
    }
    
    func postFailed(error: Error) {
        
        let alert = UIAlertController(title: "Create Travel Error", message: error.localizedDescription, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        createTravelPresenterDelegate?.showFailedPost(alertController: alert)
    }
    
}
