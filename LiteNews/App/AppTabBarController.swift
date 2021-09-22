//
//  AppTabBarController.swift
//  LiteNews
//
//  Created by Anang Nugraha on 23/09/21.
//

import UIKit

class AppTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let exploreVC = ExploreViewController()
        let favoriteVC = FavoriteViewController()
        
        homeVC.title = "Home"
        exploreVC.title = "Explore"
        favoriteVC.title = "Favorite"
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let exploreNav = UINavigationController(rootViewController: exploreVC)
        let favoriteNav = UINavigationController(rootViewController: favoriteVC)
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        exploreNav.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        favoriteNav.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(systemName: "bookmark.fill"), tag: 0)
        
        setViewControllers([homeNav, exploreNav, favoriteNav], animated: true)

    }

}
