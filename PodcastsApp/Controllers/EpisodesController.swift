//
//  EpisodesController.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 29.01.2022.
//

import UIKit
import FeedKit

class EpisodesController: UITableViewController {
    
    private let cellId = "cellId"
    
    var podcast: Podcasts? {
        didSet {
            navigationItem.title = podcast?.trackName
            
            fetchFeedUrl()
        }
    }
    
    fileprivate func fetchFeedUrl() {
        guard let feedUrl = podcast?.feedUrl else { return }
        let secureFeedUrl = feedUrl.contains("https") ? feedUrl : feedUrl.replacingOccurrences(of: "http", with: "https")
        guard let url = URL(string: secureFeedUrl) else { return }
        
        let parser = FeedParser(URL: url)
        
        parser.parseAsync { (result) in
            switch result {
            
            case .success(let feed):
                switch feed {
                case .rss(let feeed):
                    var episodess = [Episodes]()
                    feeed.items?.forEach({ (feedItem) in
                        let episode = Episodes(title: feedItem.title ?? "")
                        episodess.append(episode)
                    })
                    self.episodes = episodess
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                default:
                    print("Found a feed...")
            }
            case .failure(let err):
                print("Failed to parse feedURL", err)
                return
        }
    }
}
    
    var episodes = [Episodes(title: "First"),
                    Episodes(title: "Second"),
                    Episodes(title: "Third")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let selectedIndex = episodes[indexPath.row]
        cell.textLabel?.text = selectedIndex.title
        return cell
    }
    
}
