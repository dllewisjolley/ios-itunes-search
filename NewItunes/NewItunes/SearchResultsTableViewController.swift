//
//  SearchResultsTableViewController.swift
//  NewItunes
//
//  Created by Diante Lewis-Jolley on 5/7/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {

    let searchResultController = SearchResultController()

    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self

    }

    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchResultController.searchResults.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItuneCell", for: indexPath)
        let searchResult = searchResultController.searchResults[indexPath.row]

        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.creator

        // Configure the cell...

        return cell
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var resultType: ResultType!
        guard let searchBarText = searchBar.text else { return }
        if segmentController.selectedSegmentIndex == 0 {
            resultType = ResultType.software

            searchResultController.performSearch(with: searchBarText, searchType: resultType) { (error) in
                if let error = error {
                    NSLog("\(error)")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        } else if segmentController.selectedSegmentIndex == 1 {
            resultType = ResultType.musicTrack
            searchResultController.performSearch(with: searchBarText, searchType: resultType) { (error) in
                if let error = error {
                    NSLog("\(error)")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        } else {
            resultType = ResultType.movie
            searchResultController.performSearch(with: searchBarText, searchType: resultType) { (error) in
                if let error = error {
                    NSLog("\(error)")
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }


    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var segmentController: UISegmentedControl!

}
