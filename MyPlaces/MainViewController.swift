//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 20/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {


    
    // var places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return places.count
//    }

    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
//
//        let place = places[indexPath.row]
//
//        cell.nameLabel.text = place.name
//        cell.locationLabel.text = place.location
//        cell.typeLabel.text = place.type
//
//        if place.image == nil {
//            cell.imageOfPlace.image = UIImage(named: place.restaurantImage!)
//        } else {
//            cell.imageOfPlace.image = place.image
//        }
//
//
//        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 3
//        cell.imageOfPlace.clipsToBounds = true
//
//        return cell
//    }
    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        guard let newPlaceVC = unwindSegue.source as? NewPlaceViewController else { return }
        newPlaceVC.saveNewPlace()
       // places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }

}
