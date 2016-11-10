//
//  SelectedTabltViewController.swift
//  medical-app
//
//  Created by Administrator on 10/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class SelectedTabltViewController: UIViewController {
    
    var TopicPassed:String!
    
    @IBOutlet weak var NavBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = TopicPassed
        
    }

}
