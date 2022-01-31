//
//  NetworkManager.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 29.01.2022.
//

import UIKit
import Alamofire
import FeedKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchPodcasts(searchText: String, completed: @escaping ([Podcasts]) -> ()) {
        let url = "https://itunes.apple.com/search"
        let parameters = ["term": searchText, "media": "podcast"]
        
        AF.request(url, method: .get, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default, headers: nil).responseData { (dataResponse) in
            if let err = dataResponse.error {
                print("Invalid data try again", err)
                return
            }
            guard let data = dataResponse.data else { return }
            do {
                let decoder = JSONDecoder()
                let searchResult = try decoder.decode(SearchResults.self, from: data)
                completed(searchResult.results)
            } catch let dataErr{
                print("Failed fetching data", dataErr)
                return
            }  
        }
    }

    func fetchEpisodes(feedUrl: String, completed: @escaping (([Episodes]) -> ())) {
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureFeedUrl) else { return }
        
        let parser = FeedParser(URL: url)
        
        parser.parseAsync { (result) in
            
            switch result {
            case .success(let feed):
                switch feed {
                case .rss(let feeed):
                    let episodes = feeed.toEpisodes()
                    completed(episodes)
                default:
                    print("Found a feed...")
            }
            case .failure(let err):
                print("Failed to parse feedURL", err)
                return
            }
        }
    }
    
}
