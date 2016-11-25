//
//  RatePainViewController.swift
//  medical-app
//
//  Created by Administrator on 14/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RatePainViewController: UIViewController {

    
    @IBOutlet weak var Ratelbl: UILabel!
    @IBOutlet weak var CommentText: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

////    if let navigationBar = self.navigationController?.navigationBar {
//        let firstFrame = CGRect(x: 0, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
////        let secondFrame = CGRect(x: navigationBar.frame.width/2, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
//        
//        let firstLabel = UILabel(frame: firstFrame)
//        firstLabel.text = "First"
////        
////        let secondLabel = UILabel(frame: secondFrame)
////        secondLabel.text = "Second"
//        
//        navigationBar.addSubview(firstLabel)
////        navigationBar.addSubview(secondLabel)
////       }
    }

    @IBAction func PainRateSlider(sender: UISlider)
    {
        var currentValue = Int(sender.value)
        
        Ratelbl.text = "\(currentValue)"
    }
    
    
    @IBAction func closeAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
