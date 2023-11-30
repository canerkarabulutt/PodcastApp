//
//  MainTabBarController.swift
//  PodcastApp
//
//  Created by Caner Karabulut on 6.11.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
//MARK: - Helpers
extension MainTabBarController {
    private func setup() {
        viewControllers = [
            createViewController(rootViewController: FavoriteViewController(), title: "Favorites", imageName: "star.circle"),
            createViewController(rootViewController: SearchViewController(), title: "Search", imageName: "sparkle.magnifyingglass"),
            createViewController(rootViewController: DownloadViewController(), title: "Downloads", imageName: "play.square.stack.fill")
        ]
        tabBar.tintColor = .purple
    }
    private func createViewController(rootViewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        rootViewController.title = title
        let appearance = UINavigationBarAppearance()
        appearance.configureWithDefaultBackground()
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.navigationBar.prefersLargeTitles = true
        controller.navigationBar.compactAppearance = appearance
        controller.navigationBar.standardAppearance = appearance
        controller.navigationBar.scrollEdgeAppearance = appearance
        controller.navigationBar.compactScrollEdgeAppearance = appearance
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: imageName)
        return controller
    }
}
