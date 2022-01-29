//
//  PodcastsSearchController.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 26.01.2022.
//

import UIKit
import Alamofire

class PodcastsSearchController: UITableViewController {
    
    var podcastArr = [Podcasts]()
    
    private let cellId = "cellId"
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchController()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: "PodcastCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellId)
        tableView.rowHeight = 132
        tableView.tableFooterView = UIView()
    }
    
    func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search for a podcast"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcastArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PodcastCelll
        let selectedIndex = self.podcastArr[indexPath.row]
        cell.podcast = selectedIndex
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Please enter a search Term"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        return label
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.podcastArr.count > 0 ? 0 : 250
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedIndex = podcastArr[indexPath.row]
        let episodesController = EpisodesController()
        episodesController.podcast = selectedIndex
        navigationController?.pushViewController(episodesController, animated: true)
    }
    
}

extension PodcastsSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NetworkManager.shared.fetchPodcasts(searchText: searchText) { (podcast) in
            self.podcastArr = podcast
            DispatchQueue.main.async {
                self.tableView.reloadData() 
            }
        }
    }
}
