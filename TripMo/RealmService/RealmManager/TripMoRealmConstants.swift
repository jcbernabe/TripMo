//
//  TripMoRealmConstants.swift
//  TripMo
//
//  Created by Hanet on 8/17/17.
//  Copyright © 2017 JcBernabe. All rights reserved.
//

import Foundation
import RealmSwift

struct TripMoRealmConstants {
    
    static let localHost                = "localhost"
    static let localURL                 = "http://localhost:9080"
    
    static let remoteHost               = "139.59.113.29"
    static let remoteURL                = "http://139.59.113.29:9080"
    
    static let syncHost                 = "127.0.0.1"// "192.241.218.72" //"127.0.0.1"
    static let ApplicationName          = "TripMo"
    
    static let commonRealmURL = URL(string: "realm://\(syncHost):9080/\(ApplicationName)-CommonTravels")!
    static let commonRealmConfig = Realm.Configuration(syncConfiguration: SyncConfiguration(user: SyncUser.current!, realmURL: commonRealmURL))
}
