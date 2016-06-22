//
//  NoteTableViewCell.swift
//  note taking
//
//  Created by Administrator on 14/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
