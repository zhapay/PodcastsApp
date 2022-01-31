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
    var episodes = [Episodes]()
    
    var podcast: Podcasts? {
        didSet {
            navigationItem.title = podcast?.trackName
            
            fetchFeedUrl()
        }
    }
    
    fileprivate func fetchFeedUrl() {
        guard let feedUrl = podcast?.feedUrl else { return }
        NetworkManager.shared.fetchEpisodes(feedUrl: feedUrl) { (episodes) in
            self.episodes = episodes
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: "EpisodesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! EpisodesCell
        let selectedIndex = episodes[indexPath.row]
        cell.episode = selectedIndex
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 134
    }
    
}
