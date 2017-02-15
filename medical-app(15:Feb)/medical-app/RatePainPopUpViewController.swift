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
    var rate: String?
    var Cmt: String?
    
    var databaseRef: FIRDatabaseReference!{
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    @IBAction func PainRateSlider(sender: UISlider)
    {
        var currentValue = Int(sender.value)
        
        Ratelbl!.text = "\(currentValue)"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "goToRemedyVC" {
            
            let vc = segue.destinationViewController as! RemedyViewController
            vc.RateRev = Ratelbl?.text
           print(vc.RateRev)
            vc.CmtRev = CommentText!.text
            print(vc.CmtRev)


        }
    }
    
    @IBAction func closeAction(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        CommentText!.resignFirstResponder()
        
        
    }
    

    
}
