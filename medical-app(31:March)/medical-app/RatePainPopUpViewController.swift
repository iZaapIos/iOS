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
import FirebaseDatabase

class RatePainPopUpViewController: UIViewController {

    
    @IBOutlet weak var Ratelbl: UILabel?
    @IBOutlet weak var CommentText: UITextView?
    var rate: String!
    var Cmt: String!
    var Arr: String!
    var part: String!
    
    var temp = [String]()
    var painArr: [String] = []
    
    var databaseRef: FIRDatabaseReference!{
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
         print(part)
       
       
        
    }
    @IBAction func PainRateSlider(sender: UISlider)
    {
        var currentValue = Int(sender.value)
        
        Ratelbl!.text = "\(currentValue)"
    
    }
    

    
    
    @IBAction func choose(sender: AnyObject) {
        
//        temp.append(Ratelbl!.text!)
//        temp.append(part)
//        temp.append(CommentText!.text)
//        
////         print(temp)
//        Arr = temp.description
//        
////        print(Arr)
//        
//        
//        painArr.append(Arr)
//        print(painArr)
        self.dismissViewControllerAnimated(true, completion: nil);
    }
    
    @IBAction func submit(sender: AnyObject) {
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        CommentText!.resignFirstResponder()
        
        
    }
    

    
}
