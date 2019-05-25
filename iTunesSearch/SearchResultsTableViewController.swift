//
//  SearchResultsTableViewController.swift
//  iTunesSearch
//
//  Created by Dongwoo Pae on 5/25/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController {

    @IBOutlet weak var categorySegmentedController: UISegmentedControl!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)


        return cell
    }

}
