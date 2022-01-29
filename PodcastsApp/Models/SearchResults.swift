//
//  SearchResults.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 28.01.2022.
//

import UIKit

struct SearchResults: Decodable {
    var resultCount: Int
    var results: [Podcasts]
}
