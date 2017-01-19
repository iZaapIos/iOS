
//
//  checkBox.swift
//  medical-app
//
//  Created by Administrator on 28/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
class checkBox: UIButton {
    
    //images
    
    
    let checkedImage = UIImage(named: "Checked_Checkbox.png")!
   as UIImage
    let UncheckedImage = UIImage(named: "Unchecked_Checkbox.png")!
        as UIImage
    
    //bool property 
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                 self.setImage(checkedImage, forState: .Normal)
                
            }else{
                self.setImage(UncheckedImage, forState: .Normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    func buttonClicked(sender:UIButton)
    {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                 isChecked = true
            }
        }
    }
}
