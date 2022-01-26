//
//  MainTabBarController.swift
//  PodcastsApp
//
//  Created by Dastan Zhapay on 26.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBar()
    }
    
    func configureTabBar() {
        UINavigationBar.appearance().prefersLargeTitles = true
        UITabBar.appearance().tintColor = .purple
        viewControllers = [createSearchNavController(), createFavoritesNavController(), createDownloadsNavController()]
    }
    
    func createSearchNavController() -> UINavigationController {
        let searchNavController = PodcastsSearchController()
        searchNavController.title = "Search"
        searchNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchNavController)
    }
    
    func createFavoritesNavController() -> UINavigationController {
        let favoritesNavController = ViewController()
        favoritesNavController.title = "Favorites"
        favoritesNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesNavController)
    }
    
    func createDownloadsNavController() -> UINavigationController {
        let downloadsNavController = ViewController()
        downloadsNavController.title = "Downloads"
        downloadsNavController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        return UINavigationController(rootViewController: downloadsNavController)
    }
    
}
