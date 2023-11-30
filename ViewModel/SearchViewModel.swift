//
//  SearchViewModel.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import Foundation

struct SearchViewModel {
    let podcast: Podcast
    init(podcast: Podcast) {
        self.podcast = podcast
    }
    var cellImageUrl: URL? {
        return URL(string: podcast.artworkUrl600 ?? "")
    }
    var trackCountString: String? {
        return "\(podcast.trackCount ?? 0)"
    }
    var artistName: String? {
        return podcast.artistName
    }
    var trackName: String? {
        return podcast.trackName
    }
}
