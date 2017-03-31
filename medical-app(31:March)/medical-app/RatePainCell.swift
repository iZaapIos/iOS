//
//  RatePainCell.swift
//  medical-app
//
//  Created by Administrator on 11/02/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

//class RatePainCell: UITableViewCell {
//    @IBOutlet weak var PartsImage: UIImageView!
//    @IBOutlet weak var PartName: UILabel!
//
//}

class RatePainCell: UICollectionViewCell {

    @IBOutlet weak var PartsImage: UIImageView!
    
    @IBOutlet weak var partLbl: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var tick: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.makeItCircle()
    }
    
    func makeItCircle() {
        self.button.layer.masksToBounds = true

        
//        self.button.layer.cornerRadius = button.frame.size.width / 2
        self.button.clipsToBounds = true
        self.button.layer.borderColor = UIColor.grayColor().CGColor
        self.button.layer.borderWidth = 4
        
        self.partLbl.layer.borderColor = UIColor.grayColor().CGColor
         self.partLbl.layer.borderWidth = 2
    }
    
    
}
