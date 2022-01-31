//
//  Ext + RSSFeed.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 31.01.2022.
//

import UIKit
import FeedKit

extension RSSFeed {
    func toEpisodes() -> [Episodes] {
        var episodess = [Episodes]()
        let imageUrll = iTunes?.iTunesImage?.attributes?.href
        items?.forEach({ (feedItem) in
            var episode = Episodes(feedItem: feedItem)
            
            if episode.imageUrl == "" {
                episode.imageUrl = imageUrll
            }
            
            episodess.append(episode)
        })
        return episodess
    }
}
