//
//  RealmManagerProtocols.swift
//  TripMo
//
//  Created by Hanet on 6/21/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmManagerInterface {
    
    /**
        Open a synchronized **Realm** instance. Will be used to handle all realm requests and processes.
     
        **throws** error.
     */
    func openSynchronizedRealmWith(configuration: Realm.Configuration, user: SyncUser) throws
}
