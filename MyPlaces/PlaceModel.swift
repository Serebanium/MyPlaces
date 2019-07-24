//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 21/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//


import RealmSwift

class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location : String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    
    convenience init(name: String, location: String?, tupe: String?, imageData: Data?) {
        self.init()
        self.name = name
        self.location = location
        self.type = tupe
        self.imageData = imageData
    }
}
