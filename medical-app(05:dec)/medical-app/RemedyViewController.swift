//
//  RemedyViewController.swift
//  medical-app
//
//  Created by Administrator on 25/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class RemedyViewController: UIViewController {
    
    var RateRev: String?
    var CmtRev: String?
    let medic = [medlist]()
    var remedy = [NSArray]()
    
    //buttons outlets
    
    @IBOutlet weak var btn1: checkBox!
    @IBOutlet weak var btn2: checkBox!
    @IBOutlet weak var btn3: checkBox!
    @IBOutlet weak var btn4: checkBox!
    @IBOutlet weak var btn5: checkBox!
    @IBOutlet weak var btn6: checkBox!
    
    
    //label outlets
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    @IBOutlet weak var lbl6: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(RateRev)
//        print("loaded")
//        print(CmtRev)
        
        
      
    }
    

    @IBAction func btn1Action(sender: AnyObject) {
        
    }
    
    
    @IBAction func btn2Action(sender: AnyObject) {
    }
    
    @IBAction func btn3Action(sender: AnyObject) {
    }
    
    
    
    
    
    
    @IBAction func SaveAction(sender: AnyObject)
    {
        
               
    }
}
