//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 20/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {


    
    let places = Place.getPlaces()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].image)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 3
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
    }
    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    

}
