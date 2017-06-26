//
//  BWHomeViewController.swift
//  BWOnlineEducationiOSInSwift
//
//  Created by BobWong on 2017/6/19.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

import UIKit

class BWHomeViewController: BWBaseViewController, UICollectionViewDataSource {

    // MARK: UI
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Data
    var dataSource: NSMutableArray?
    

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Push", style: .plain, target: self, action: #selector(push))
    }
    
    // MARK: Private Method
    
    func setData() {
        dataSource = NSMutableArray()
    }
    
    func push() {
        let vc = BWBaseViewController.init()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: System Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dataSource != nil) ? (dataSource?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }

}
