//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 23/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {
        
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject(_ place: Place) {
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
