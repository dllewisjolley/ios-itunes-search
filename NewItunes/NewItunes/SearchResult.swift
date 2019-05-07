//
//  SearchResult.swift
//  NewItunes
//
//  Created by Diante Lewis-Jolley on 5/7/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    let title: String
    let creator: String

    enum CodingKeys: String, CodingKey {

        case title = "artistName"
        case creator = "trackName"
    }


}

struct SearchResults: Codable {
    let result: [SearchResult]
}

