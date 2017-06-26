//
//  BWMainTabBarController.swift
//  BWOnlineEducationiOSInSwift
//
//  Created by BobWong on 2017/6/19.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

import UIKit

class BWMainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = BWHomeViewController.init()
        let homeNvgtVC = UINavigationController.init(rootViewController: homeVC)
        homeNvgtVC.tabBarItem.title = "Home"
        
        let sortVC = BWSortViewController.init()
        let sortNvgtVC = UINavigationController.init(rootViewController: sortVC)
        sortNvgtVC.tabBarItem.title = "Sort"
        
        let discoveryVC = BWDiscoveryViewController.init()
        let discoveryNvgtVC = UINavigationController.init(rootViewController: discoveryVC)
        discoveryNvgtVC.tabBarItem.title = "Discovery"
        
        let meVC = BWMeViewController.init()
        let meNvgtVC = UINavigationController.init(rootViewController: meVC)
        meNvgtVC.tabBarItem.title = "Me"
        
        self.viewControllers = [homeNvgtVC, sortNvgtVC, discoveryNvgtVC, meNvgtVC]
    }

}
