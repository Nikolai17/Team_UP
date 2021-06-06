//
//  MainTabBarViewController.swift
//  Team_UP
//
//  Created by Dmitry Kulagin on 05.06.2021.
//

import UIKit

class MainTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        modalPresentationStyle = .fullScreen
        
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
        
        delegate = self
        
        let competitionVC = UINavigationController(rootViewController: CompetitionsViewController())
        let feedsVC = UINavigationController(rootViewController: FeedsViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        viewControllers = [competitionVC, feedsVC, profileVC]
        selectedIndex = 1

        tabBar.tintColor = UIColor(red: 0.918, green: 0.337, blue: 0.086, alpha: 1)
        tabBar.unselectedItemTintColor = .white
        
        tabBar.barTintColor = UIColor(red: 0.035, green: 0.035, blue: 0.188, alpha: 1)
        tabBar.isTranslucent = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
