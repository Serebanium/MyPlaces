//
//  MainViewController.swift
//  MyPlaces
//
//  Created by Сергей Иванов on 20/07/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let searchController = UISearchController(searchResultsController: nil)
    
    private var ascendingSorting = true
    
    private var places: Results<Place>!
    private var filteredPlaces: Results<Place>!
    
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var sortingButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        places = realm.objects(Place.self)
        
        // Настройка serchController-a
        searchController.searchResultsUpdater = self                     // получателем данных о поиске будет наш класс
        searchController.obscuresBackgroundDuringPresentation = false   // даст работать с результатами поиска: добавление, удаление, редактирование
        searchController.searchBar.placeholder = "Поиск"                // надпись в поле поиска
        navigationItem.searchController = searchController              // встраиваем поиск прямо в навигейшен бар
        definesPresentationContext = true                               // при переходе на другой экран строка поиска убирается
        
        
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredPlaces.count
        }
        return places.isEmpty ? 0 : places.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        var place = Place()
       
        if isFiltering {
            place = filteredPlaces[indexPath.row]
        } else {
            place = places[indexPath.row]
        }

        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        cell.imageOfPlace.image = UIImage(data: place.imageData!)

        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 3
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
    // MARK: - Table View Delegate
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let place: Place
        if isFiltering {
            place = filteredPlaces[indexPath.row]
        } else {
            place = places[indexPath.row]
        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Удалить") { (_, _) in
            StorageManager.deleteObject(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return [deleteAction]
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let place: Place
            if isFiltering {
                place = filteredPlaces[indexPath.row]
            } else {
                place = places[indexPath.row]
            }
            let newPlaceVC = segue.destination as! NewPlaceViewController
            newPlaceVC.currentPlace = place
        } 
    }
    
    @IBAction func unwindToMain(_ unwindSegue: UIStoryboardSegue) {
        guard let newPlaceVC = unwindSegue.source as? NewPlaceViewController else { return }
        newPlaceVC.savePlace()
        tableView.reloadData()
    }

    @IBAction func sortSelection(_ sender: UISegmentedControl) {
        
        sorting()
    }
    
    @IBAction func reverseSorting(_ sender: Any) {
        
        ascendingSorting.toggle()
        
        if ascendingSorting {
            sortingButton.image = #imageLiteral(resourceName: "AZ")
        } else {
            sortingButton.image = #imageLiteral(resourceName: "ZA")
        }
        
        sorting()
    }
    
    private func sorting() {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            places = places.sorted(byKeyPath: "date", ascending: ascendingSorting)
        } else {
            places = places.sorted(byKeyPath: "name", ascending: ascendingSorting)
        }
        
        tableView.reloadData()
    }
}

extension MainViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        
        filteredPlaces = places.filter("name CONTAINS[c] %@ OR location CONTAINS[c] %@", searchText, searchText)
        tableView.reloadData()
    }
}
