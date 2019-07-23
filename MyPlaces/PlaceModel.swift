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
    
    let restaurantNames = [
        "Восход",
        "Робин",
        "Крым",
        "Суши",
        "Шаурма",
        "Сити",
        "Погребок"
        ]
    
    func savePlaces() {
        
        for place in restaurantNames {
            
            let image = UIImage(named: place)
            guard let imageData = image?.pngData() else { return }
            let newPlace = Place()
            
            newPlace.name = place
            newPlace.location = "Мантурово"
            newPlace.type = "Ресторан"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)
       }
    }
    
}
