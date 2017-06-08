//
//  CreateTravelProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/8/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import UIKit

protocol CreateTravelInteractorInterface {
    
    weak var createTravelInteractorDelegate: CreateTravelInteractorDelegate? {get set}
    
}

protocol CreateTravelInteractorDelegate: class {
    
    func postSuccessful()
    func postFailed(error: Error)
    
}

protocol CreateTravelPresenterInterface {
    
    weak var createTravelPresenterDelegate: CreateTravelPresenterDelegate? {get set}
    
    
}

protocol CreateTravelPresenterDelegate: class {
    
    func showSuccessfulPost()
    func showFailedPost(alertController: UIAlertController)
    
}
