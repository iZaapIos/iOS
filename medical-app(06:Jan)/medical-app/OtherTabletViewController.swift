//
//  OtherTabletViewController.swift
//  medical-app
//
//  Created by Administrator on 17/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class OtherTabletViewController: UIViewController {

    @IBOutlet weak var medicationTextField: UITextField!
    @IBOutlet weak var DosageTextField: UITextField!
    @IBOutlet weak var IntervalLbl: UILabel!
    @IBOutlet weak var TabNoLbl: UILabel!
    @IBOutlet weak var freqlbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func TabsSlider(sender: UISlider) {
        var TabValue = Int(sender.value)
        
        TabNoLbl.text = "\(TabValue)"
        
    }
    
    
    @IBAction func IntervalSlider(sender: UISlider) {
        
        var currentValue = Int(sender.value)
        
        IntervalLbl.text = "\(currentValue)"
    }
    
    
    @IBAction func FreqSlider(sender: UISlider) {
        
        var currentVal = Int(sender.value)
        
        freqlbl.text = "\(currentVal)"
    }
    

    
}


