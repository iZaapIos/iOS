//
//  ViewController.swift
//  sam2_using_firebase
//
//  Created by Administrator on 28/07/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    var ref: FIRDatabaseReference!

    @IBOutlet weak var mailId: UITextField!
    @IBOutlet weak var Pswd: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Sign_Up(sender: AnyObject)    {
        FIRAuth.auth()?.createUserWithEmail(mailId.text!, password: Pswd.text!, completion: {(user,error) in

            if error != nil{
                print(error)
                return
            }
            let userID: String = user!.uid
            let userEmail: String = self.mailId.text!
            let userPswd: String = self.Pswd.text!
            
            //to create child in Db to store data using setvalue method
            self.ref.child("UserAcc").child(userID).setValue(["Email": userEmail, "Password": userPswd])
            
            print("User registered with firebase id of: " + user!.uid)
            })
        
    }

    
    @IBAction func Sign_In(sender: AnyObject)
    {
    FIRAuth.auth()?.signInWithEmail(mailId.text!, password: Pswd.text!, completion: {(user,error) in
        
        if error != nil
        {
            print(error)
            return
        }
        
        print("user logged in with firebase id of :" + user!.uid)
        })
        
    }

    
    @IBAction func SignOut(sender: AnyObject)
    {
        print("user logged out ...")
        try! FIRAuth.auth()?.signOut()
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        mailId.resignFirstResponder()
        Pswd.resignFirstResponder()
    }
    
    
    
}

