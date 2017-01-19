//
//  ClinicianCell.swift
//  medical-app
//
//  Created by Administrator on 06/01/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class ClinicianCell: UITableViewCell {
    
    
    @IBOutlet weak var clinician: UILabel!
    @IBOutlet weak var clinName: UILabel!
    @IBOutlet weak var clinEmail: UILabel!
    @IBOutlet weak var clinPh: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
