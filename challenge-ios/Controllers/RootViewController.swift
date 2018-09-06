//
//  RootViewController.swift
//  challenge-ios
//
//  Created by Маторин Николай on 04.09.2018.
//  Copyright © 2018 Маторин Николай. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    // MARK: - View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIStyle.Colors.barColor
        tabBar.tintColor = UIStyle.Colors.orange

        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedIndex = 1
    }
    
    // MARK: - Private Methods
    
    private func setupViewControllers() {
        let tvVC = UIViewController()
        tvVC.tabBarItem = UITabBarItem(title: UIStyle.Titles.tv, image: UIStyle.Icons.tv, tag: 0)
        
        let videosVC = ViewController()
        videosVC.tabBarItem = UITabBarItem(title: UIStyle.Titles.video, image: UIStyle.Icons.video, tag: 1)
        videosVC.viewModel = VideosViewModel(data: Mockup.data)
        
        let subscriptionsVC = UIViewController()
        subscriptionsVC.tabBarItem = UITabBarItem(title: UIStyle.Titles.subscriptions, image: UIStyle.Icons.subscriptions, tag: 2)
        
        let accountVC = UIViewController()
        accountVC.tabBarItem = UITabBarItem(title: UIStyle.Titles.account, image: UIStyle.Icons.account, tag: 3)
        
        let settingsVC = UIViewController()
        settingsVC.tabBarItem = UITabBarItem(title: UIStyle.Titles.settings, image: UIStyle.Icons.settings, tag: 4)
        
        let viewControllerList = [tvVC, videosVC, subscriptionsVC, accountVC, settingsVC]
        
        viewControllers = viewControllerList.map { UINavigationController(rootViewController: $0) }
    }
}
