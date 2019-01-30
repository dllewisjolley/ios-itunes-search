//
//  SearchResult.swift
//  ITunes
//
//  Created by Diante Lewis-Jolley on 1/30/19.
//  Copyright © 2019 Diante Lewis-Jolley. All rights reserved.
//

import Foundation


struct SearchResult: Codable {
    var title: String
    var creator: String

    enum CodingKeys: String, CodingKey {

        case title = "trackName"
        case creator = "artistName"
    }
}

struct SearchResults {
    let result = [SearchResult].self
}
