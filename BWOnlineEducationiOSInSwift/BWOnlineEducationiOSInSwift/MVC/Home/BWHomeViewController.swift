//
//  BWHomeViewController.swift
//  BWOnlineEducationiOSInSwift
//
//  Created by BobWong on 2017/6/19.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

import UIKit

class BWHomeViewController: BWBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Push", style: .plain, target: self, action: #selector(push))
    }
    
    func push() {
        let vc = BWBaseViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
