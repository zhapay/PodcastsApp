//
//  Episodes.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 29.01.2022.
//

import Foundation
import FeedKit

struct Episodes {
    var title: String?
    var description: String
    var pubDate: Date
    var imageUrl: String?
    
    init(feedItem: RSSFeedItem) {
        self.title = feedItem.title
        self.description = feedItem.description ?? ""
        self.pubDate = feedItem.pubDate ?? Date()
        self.imageUrl = feedItem.iTunes?.iTunesImage?.attributes?.href ?? ""
    }
}
