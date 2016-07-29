//
//  AccViewController.swift
//  sam2_using_firebase
//
//  Created by Administrator on 29/07/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class AccViewController: UIViewController {
    
    var ref:FIRDatabaseReference!
    var refHandler: UInt!

    @IBOutlet weak var UserLabel: UILabel!
    @IBOutlet weak var PswdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        refHandler = ref.observeEventType(FIRDataEventType
            .Value,withBlock: { (snapshot) in
                let dataDict = snapshot.value as! [String: AnyObject]
                
                print(dataDict)
                
        })
        
        //to display the db data on VC
        let userID: String = (FIRAuth.auth()?.currentUser?.uid)!
        ref.child("UserAcc").child(userID).observeSingleEventOfType(.Value,withBlock: { (snapshot) in
            let email = snapshot.value!["Email"] as! String
            let password = snapshot.value!["Password"] as! String
            self.UserLabel.text = email
            self.PswdLabel.text = password
        })
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
