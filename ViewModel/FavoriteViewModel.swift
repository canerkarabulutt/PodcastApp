//
//  FavoriteViewModel.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 8.11.2023.
//

import Foundation

struct FavoriteViewModel {
    var podcastCoreData: PodcastCoreData!
    init(podcastCoreData: PodcastCoreData!) {
        self.podcastCoreData = podcastCoreData
    }
    var imageUrlPodcast: URL? {
        return URL(string: podcastCoreData.artworkUrl600!)
    }
    var podcastMediaNameLabel: String? {
        return podcastCoreData.trackName
    }
    var podcastArtistNameLabel: String? {
        return podcastCoreData.artistName
    }
}
