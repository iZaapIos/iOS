//
//  summaryTableCell.swift
//  medical-app
//
//  Created by Administrator on 17/01/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class summaryTableCell: UITableViewCell {
    
    @IBOutlet weak var painlvl_lbl: UILabel!
    @IBOutlet weak var comments_lbl: UILabel!
    @IBOutlet weak var create_lbl: UILabel!
    @IBOutlet weak var remedy_lbl: UILabel!
    @IBOutlet weak var key_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
