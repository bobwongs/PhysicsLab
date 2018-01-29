//
//  BWHomeViewController.swift
//  BWOnlineEducationiOSInSwift
//
//  Created by BobWong on 2017/6/19.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

import UIKit
import SDWebImage

let BWHomeCellId = "BWHomeCellId"

class BWHomeViewController: BWBaseViewController, UICollectionViewDataSource, BWHomeCellDelegate {

    // MARK: UI
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var outputTextView: UITextView!
    
    // MARK: Data
    var dataSource: NSMutableArray?
    

    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Push", style: .plain, target: self, action: #selector(push))
        
        self.collectionView.register(UINib.init(nibName: "BWHomeCell", bundle: nil), forCellWithReuseIdentifier: BWHomeCellId)
        self.setData()
        self.collectionView.reloadData()
    }
    
    // MARK: Private Method
    
    func setData() {
        let array = ["1", "2", "3"]
        
        self.dataSource = NSMutableArray.init(array: array)
    }
    
    func push() {
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8000/MobileApp/UserInfo")!)
        request.httpMethod = "POST"
        
        // If is http, set the parameter in http body
        let postString = "name=Bob&id=123"
        request.httpBody = postString.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {  // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {  // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
            
            DispatchQueue.main.async {
                self.outputTextView.text = responseString
            }
        }
        task.resume()
        
//        let vc = BWBaseViewController.init()
//        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: System Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (self.dataSource != nil) ? (self.dataSource?.count)! : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: BWHomeCellId, for: indexPath) as! BWHomeCell
//        cell.delegate = self
        cell.editHandler = {
            print("edit handler \(self.dataSource?.object(at: indexPath.row))")
        }
        cell.titleLabel.text = self.dataSource?.object(at: indexPath.row) as! String?
        cell.backgroundImageView.sd_setImage(with: URL(string: "https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png"))
        return cell
    }
    
    // MARK: Custom Delegate
    
    func triggleHomeCellEdit() {
        print("triggleHomeCellEdit")
    }

}
