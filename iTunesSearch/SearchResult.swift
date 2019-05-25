//
//  SearchResult.swift
//  iTunesSearch
//
//  Created by Dongwoo Pae on 5/25/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    let title: String
    let creator: String
}

struct SearchResults: Codable {
    let results: [SearchResult]
}

enum CodingKeys: String, CodingKey {
    case title = "trackName"
    case creator = "artistName"
}

//artistName, trackName
