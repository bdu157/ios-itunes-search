//
//  SearchResultsTableViewController.swift
//  iTunesSearch
//
//  Created by Dongwoo Pae on 5/25/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    

    
    let searchResultsController = SearchResultController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBar.delegate = self

    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var resultType: ResultType!
        
        switch
        self.categorySegmentedControl.selectedSegmentIndex{
        case 0:  //Apps
            resultType = .software
        case 1: //Music
            resultType = .musicTrack
        case 2: //Movie
            resultType = .movie
        //no default needed here because we used all options -0,1,2??
        default:
            resultType = .software
        }
        
        guard let searchTerm = self.searchBar.text else {return}
        
        self.searchResultsController.performSearch(searchTerm: searchTerm, resultType: resultType) { (error) in
            if let error = error {
                print("there is an error: \(error)")
                return
            } else {
             
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsController.searchResults.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let searchResults = searchResultsController.searchResults[indexPath.row]
        cell.detailTextLabel?.text = searchResults.creator
        cell.textLabel?.text = searchResults.title
        return cell
    }

}
