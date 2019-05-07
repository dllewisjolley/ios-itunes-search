//
//  SearchResultController.swift
//  NewItunes
//
//  Created by Diante Lewis-Jolley on 5/7/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation

class SearchResultController {

    private let baseURL = URL(string: "https://itunes.apple.com/search")!
    var searchResults: [SearchResult] = []

    func performSearch(with searchTerm: String, searchType: ResultType, completion:  @escaping (Error?) -> Void) {

        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)

        let queryItems = URLQueryItem(name: "term", value: searchTerm)
        let queryItem = URLQueryItem(name: "entity", value: searchType.rawValue)

        urlComponents?.queryItems = [queryItems, queryItem]

        var urlRequest = URLRequest(url: baseURL)
        urlRequest.httpMethod = "GET"

        URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching data: \(error)")
                completion(error)

            } else {
                guard let data = data else {
                    NSLog("No data returned")
                    completion(NSError())
                    return
                }
              let decoder = JSONDecoder()

                do {
                    let searchResultsArray = try decoder.decode(SearchResults.self, from: data)
                    self.searchResults = searchResultsArray.result
                    completion(nil)
                    
                } catch {
                    NSLog("")
                    completion(error)
                }
            }
        }.resume()



    }








}
