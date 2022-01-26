//
//  PodcastsSearchController.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 26.01.2022.
//

import UIKit

class PodcastsSearchController: UITableViewController {
    
    var podcasts = [Podcasts(name: "Lets build that app", artistName: "Brian Voong"),
                    Podcasts(name: "Sean Allen vlog", artistName: "Github App")]
    
    private let cellId = "cellId"
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchController()
    }
    
    func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    func configureSearchController() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Search for a podcast"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let selectedIndex = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(selectedIndex.name)\n\(selectedIndex.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = Images.placeholderImage
        return cell
    }
}

extension PodcastsSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
