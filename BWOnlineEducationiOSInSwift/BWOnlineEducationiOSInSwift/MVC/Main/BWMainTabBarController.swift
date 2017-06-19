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
        homeVC.tabBarItem.title = "Home"
        
        let sortVC = BWSortViewController.init()
        sortVC.tabBarItem.title = "Sort"
        
        let discoveryVC = BWDiscoveryViewController.init()
        discoveryVC.tabBarItem.title = "Discovery"
        
        let meVC = BWMeViewController.init()
        meVC.tabBarItem.title = "Me"
        
        self.viewControllers = [homeVC, sortVC, discoveryVC, meVC]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
