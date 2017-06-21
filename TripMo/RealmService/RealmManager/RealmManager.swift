//
//  RealmManager.swift
//  TripMo
//
//  Created by Hanet on 6/20/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: RealmManagerInterface {
    
    /// Shared instance of **RealmManager**
    static let sharedInstance = RealmManager()
    
    /// Synchronized Realm instance to be used on realm requests
    var globalRealm: Realm!
    
// MARK: - Open Synchronized Realm
    func openSynchronizedRealmWith(configuration: Realm.Configuration) throws {
        
        //                let permissionChange = SyncPermissionChange(realmURL: theUrl.absoluteString,    // The remote Realm URL on which to apply the changes
        //                    userID: "*",       // The user ID for which these permission changes should be applied
        //                    mayRead: true,     // Grant read access
        //                    mayWrite: false,    // Grant write access
        //                    mayManage: false)  // Grant management access
        
        do {
            self.globalRealm = try Realm(configuration: configuration)
        } catch let error {
            throw error
        }
    }
    
    
}
