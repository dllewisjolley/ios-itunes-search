//
//  SearchResultsTableViewController.swift
//  NewItunes
//
//  Created by Diante Lewis-Jolley on 5/7/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItuneCell", for: indexPath)

        // Configure the cell...

        return cell
    }


    @IBOutlet weak var searchBar: UISearchBar!

    @IBOutlet weak var segmentController: UISegmentedControl!

}
