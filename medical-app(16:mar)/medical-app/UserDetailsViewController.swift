//
//  UserDetailsViewController.swift
//  medical-app
//
//  Created by Administrator on 14/11/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
//import FirebaseDatabase


class UserDetailsViewController: UIViewController {
    
    
    var user:UserDetails?
    let userRegister = UserInfo()
  

    var first_name:String?
    var last_name:String?
    var ph_no:String?
    var e_mail:String?
    var pass_word:String?
    

   
    @IBOutlet var Firstname: UITextField!
    @IBOutlet var Lastname: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phNo: UITextField!
    @IBOutlet var password: UITextField!
    
    
    var rootRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        
    }
    @IBAction func closeAction(sender: AnyObject)
    {
        
  self.dismissViewControllerAnimated(true, completion: nil)
    
    
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

//        let currentuser = FIRAuth.auth()!.currentUser
//        let cur_user = currentuser!.email
//        print(cur_user)
        
        let userRef = FIRDatabase.database().reference().child("user_details")
//        userRef.queryOrderedByChild("email").queryEqualToValue(cur_user).observeEventType(.Value, withBlock: { (snapshot)  in
             userRef.observeEventType(.Value, withBlock: { (snapshot)  in
            
            for userInfo in snapshot.children {
                self.user = UserDetails(snapshot: userInfo as! FIRDataSnapshot)
                print(self.user)
            }
            if let user = self.user{
                self.Firstname.text = user.firstname
                print(user.firstname)
                self.Lastname.text = user.lastname
                self.email.text = user.email
                self.password.text = user.password
                 self.phNo.text = user.phoneno
            }
            
            // to reauthenticate the user
            self.e_mail = self.email.text
            self.pass_word = self.password.text

            let user = FIRAuth.auth()?.currentUser
            
            let credential = FIREmailPasswordAuthProvider.credentialWithEmail(self.e_mail!, password: self.pass_word!)
            
            user?.reauthenticateWithCredential(credential) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("User re-authenticated.")
                }
            }

        })

          self.navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func reset(sender: AnyObject) {
        
        if Firstname.text == user?.firstname{
            first_name = Firstname.text
        }else{
            first_name = Firstname.text
            print(first_name)
        }
          if Lastname.text ==  user?.lastname{
           last_name = Lastname.text
        }else{
            last_name = Lastname.text
            print(last_name)
        }
        if phNo.text == user?.phoneno{
           ph_no = phNo.text
        }else{
            ph_no = phNo.text
            print(ph_no)
        }
        if email.text == user!.email{
           self.e_mail = self.email.text
        }else{
            FIRAuth.auth()?.currentUser?.updateEmail(email.text!) { (error) in
                
                if let error = error{
                    print(error.localizedDescription)
                }
                else{
                    print("Email changed successfully")
                    let alertView = UIAlertView(title: "Success", message: "Updated Successfully", delegate: self, cancelButtonTitle: "Ok")
                    alertView.show()
                }
            }
             self.e_mail = self.email.text
             print(self.e_mail)
            
         }
        
            if password.text == user?.password{
               self.pass_word = self.password.text
                print(pass_word)
            }else
            {
                FIRAuth.auth()?.currentUser?.updatePassword(password.text!) {(error) in
                    
                    if let error = error{
                        print(error.localizedDescription)
                    }else{
                        print("Password changed successfully")
                        let alertView = UIAlertView(title: "Success", message: "Updated Successfully", delegate: self, cancelButtonTitle: "ok")
                        alertView.show()
                    }
                }
                
                self.pass_word = self.password.text
                print(self.pass_word)
                
            }

        let updatenote = UserDetails(firstname: first_name!, lastname: last_name!, email: e_mail!, phoneno: ph_no!, password: pass_word!)

        print(updatenote)
        
        
        let key = user!.ref!.key
        print(key)
        
        let updateRef = rootRef.child("/user_details/\(key)")
       
        
        updateRef.updateChildValues(updatenote.toAnyObject())
//        navigationController?.popViewControllerAnimated(true)
//        
    
        }
}








  