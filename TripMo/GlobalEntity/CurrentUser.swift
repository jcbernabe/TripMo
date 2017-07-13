//
//  CurrentUser.swift
//  TripMo
//
//  Created by Hanet on 7/13/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import UIKit

class CurrentUser {
    
    /// Shared instance of **CurrentUser**
    static let sharedInstance = CurrentUser()
    
    var currentUsername = ""
    
    func username() -> String {
        return currentUsername
    }
}
