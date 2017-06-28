//
//  BWHomeCell.swift
//  BWOnlineEducationiOSInSwift
//
//  Created by BobWong on 2017/6/26.
//  Copyright © 2017年 BobWongStudio. All rights reserved.
//

import UIKit

class BWHomeCell: UICollectionViewCell {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    var editHandler: (() -> Void)?
    weak var delegate: BWHomeCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func editAction(_ sender: Any) {
//        self.delegate?.triggleHomeCellEdit()
        
        self.editHandler?()
    }

}

protocol BWHomeCellDelegate: class {
    func triggleHomeCellEdit()
}
