//
//  UserDefaultAndHelpers.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 8.11.2023.
//

import Foundation

extension UserDefaults {
    static let downloadKey = "downloadedEpisode"
    
    static func downloadEpisodeWrite(episode: Episode) {
        do {
            var resultEpisodes = downloadEpisodeRead()
            resultEpisodes.append(episode)
            let data = try JSONEncoder().encode(resultEpisodes)
            UserDefaults.standard.set(data, forKey: UserDefaults.downloadKey)
        } catch {
            
        }
    }
    
    static func downloadEpisodeRead() -> [Episode] {
        guard let data = UserDefaults.standard.data(forKey: UserDefaults.downloadKey) else { return [] }
        do {
            let resultData = try JSONDecoder().decode([Episode].self, from: data)
            return resultData
        } catch {
            
        }
        
        return []
    }
}
