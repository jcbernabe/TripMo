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
    
    /// Local Realm instance to be used on realm requests
    var localRealm: Realm!
    
    /// Synchronized Realm instance to be used on realm requests
    var synchroRealm: Realm!
    
    
    var token: NotificationToken!
    
// MARK: - Open Local Realm
    func openLocalRealm() {
        self.localRealm = try! Realm()
    }
    
// MARK: - Open Synchronized Realm
    func openSynchronizedRealmWith(configuration: Realm.Configuration, user: SyncUser) throws {

        do {
            self.synchroRealm = try Realm(configuration: configuration)
            self.completeLogin(user: user)
        } catch let error {
            throw error
        }
    }
    
    
    private func completeLogin(user: SyncUser?) {

        setDefaultRealmConfigurationWithUser(user: user!)

        setupDefaultGlobalPermissions(user: user)

    }
    
    private func setupDefaultGlobalPermissions(user: SyncUser?) {
        
        let managementRealm = try! user!.managementRealm()
        let theURL = TripMoRealmConstants.commonRealmURL.absoluteString
        
        let permissionChange = SyncPermissionChange(realmURL: theURL,    // The remote Realm URL on which to apply the changes
            userID: "*",       // The user ID for which these permission changes should be applied
            mayRead: true,     // Grant read access
            mayWrite: true,    // Grant write access
            mayManage: false)  // Grant management access
        
        token = managementRealm.objects(SyncPermissionChange.self).filter("id = %@", permissionChange.id).addNotificationBlock { notification in
            if case .update(let changes, _, _, _) = notification, let change = changes.first {
                // Object Server processed the permission change operation
                switch change.status {
                case .notProcessed:
                    print("not processed.")
                case .success:
                    print("succeeded.")
                    // basically if you have privs on the sever, set privs in the app.
                    // this isn't really idea, but until we have the new permission API it'll suffice
                    //self.setAdminPriv()
                case .error:
                    print("Error.")
                }
                print("change notification: \(change.debugDescription)")
            }
        }
        
        try! managementRealm.write {
            print("Launching permission change request id: \(permissionChange.id)")
            managementRealm.add(permissionChange)
        }
    }
    
    private func setDefaultRealmConfigurationWithUser(user: SyncUser) {
        Realm.Configuration.defaultConfiguration = TripMoRealmConstants.commonRealmConfig
    }
    
    
}
