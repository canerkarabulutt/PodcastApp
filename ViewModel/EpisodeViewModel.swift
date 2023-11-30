//
//  EpisodeViewModel.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 7.11.2023.
//

import Foundation

struct EpisodeViewModel {
    let episode: Episode!
    init(episode: Episode!) {
        self.episode = episode
    }
    var profileImageUrl: URL? {
        return URL(string: episode.imageUrl)
    }
    var title: String? {
        return episode.title
    }
    var description: String? {
        return episode.description
    }
    var pubDate: String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: episode.pubDate)
    }
}
