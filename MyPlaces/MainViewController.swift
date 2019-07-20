//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 20/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    let restaurantNames = [
    "Восход",
    "Робин",
    "Крым",
    "Суши",
    "Шаурма",
    "Сити",
    "Погребок"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: restaurantNames[indexPath.row])

        return cell
    }
    
    // MARK: - Navigation

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    

}
