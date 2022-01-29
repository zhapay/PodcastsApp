//
//  Podcasts.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 26.01.2022.
//

import Foundation

struct Podcasts: Decodable {
    var trackName: String?
    var artistName: String?
    var artworkUrl600: String?
    var trackCount: Int?
    var feedUrl: String? 
}
