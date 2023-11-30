//
//  SearchModel.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import Foundation

struct SearchModel: Decodable {
    let resultCount: Int
    let results: [Podcast]
}

struct Podcast: Decodable {
    var trackName: String?
    var artistName: String?
    var trackCount: Int?
    var feedUrl: String?
    var artworkUrl600: String?
}
