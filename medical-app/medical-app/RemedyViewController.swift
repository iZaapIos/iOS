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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(RateRev)
        print(CmtRev)
      
    }

    @IBAction func SaveAction(sender: AnyObject)
    {
        
    }
}
