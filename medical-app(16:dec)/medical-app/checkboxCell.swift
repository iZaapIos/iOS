//
//  checkboxCellTableViewCell.swift
//  medical-app
//
//  Created by Administrator on 05/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class checkboxCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    
    
    @IBOutlet weak var remedyLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
