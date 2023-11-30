//
//  EpisodeModel.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import Foundation
import FeedKit

struct Episode: Codable {
    let title: String
    let pubDate: Date
    let description: String
    let imageUrl: String
    let streamUrl: String
    let auther: String
    
    var fileUrl: String?
    
    init(value: RSSFeedItem) {
        self.title = value.title ?? ""
        self.pubDate = value.pubDate ?? Date()
        self.description = value.iTunes?.iTunesSubtitle ?? value.description ?? ""
        self.imageUrl = value.iTunes?.iTunesImage?.attributes?.href ?? ""
        self.streamUrl = value.enclosure?.attributes?.url ?? ""
        self.auther = value.iTunes?.iTunesAuthor?.description ?? value.author ?? ""
    }
}
