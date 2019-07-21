//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 21/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import Foundation

struct Place {
    var name: String
    var location : String
    var type: String
    var image: String
    
    static let restaurantNames = [
        "Восход",
        "Робин",
        "Крым",
        "Суши",
        "Шаурма",
        "Сити",
        "Погребок"
        ]
    
    static func getPlaces() -> [Place] {
        var places: [Place] = []
        for place in restaurantNames {
            places.append(Place(name: place, location: "Мантурово", type: "Ресторан", image: place))
        }
        return places
    }
}
