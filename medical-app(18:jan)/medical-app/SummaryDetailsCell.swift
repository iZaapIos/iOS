//
//  SummaryDetailsCell.swift
//  medical-app
//
//  Created by Administrator on 19/01/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class SummaryDetailsCell: UITableViewCell {
    
    @IBOutlet weak var tablet_lbl: UILabel!
    @IBOutlet weak var dosage_lbl: UILabel!
    @IBOutlet weak var tabNo_lbl: UILabel!
    @IBOutlet weak var freq_lbl: UILabel!
    @IBOutlet weak var interval_lbl: UILabel!
    @IBOutlet weak var remin_lbl: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
