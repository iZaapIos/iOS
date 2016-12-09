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
  

    var user_name:String?
    var first_name:String?
    var last_name:String?
    var ph_no:String?
    var e_mail:String?
    var pass_word:String?
    

    @IBOutlet var Username: UITextField!
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
      
        reauthenticate()
        
    }
    @IBAction func closeAction(sender: AnyObject)
    {
        
  self.dismissViewControllerAnimated(true, completion: nil)
    
    
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        
        let userRef = FIRDatabase.database().reference().child("users")
        userRef.observeEventType(.Value, withBlock: { (snapshot)  in
            
            for userInfo in snapshot.children {
                self.user = UserDetails(snapshot: userInfo as! FIRDataSnapshot)
                print(self.user)
            }
            if let user = self.user{
                self.Username.text = user.username
                self.Firstname.text = user.firstname
                self.Lastname.text = user.lastname
                self.email.text = FIRAuth.auth()?.currentUser!.email
                self.password.text = user.password
                 self.phNo.text = user.phno
            }
        })

          self.navigationController?.popViewControllerAnimated(true)
        
    }
    @IBAction func reset(sender: AnyObject) {
        
        changeemail()
    
//        
//        let userRef = FIRDatabase.database().reference().child("users")
//        
//        if Username.text == ""{
//            Username.text = "enter title"
//        }else{
//            user_name = Username.text
//        }
//        
//        if Firstname.text == ""{
//            Firstname.text = "Firstname Missing"
//        }else{
//            first_name = Firstname.text
//        }
//        
//        if Lastname.text == ""{
//            Lastname.text = "Lastname Missing"
//        }else{
//            last_name = Lastname.text
//        }
//
//        
//        if phNo.text == ""{
//            phNo.text = "Phno Missing"
//        }else{
//            ph_no = phNo.text
//        }
//        if email.text == ""{
//            email.text = "email Missing"
//        }else{
//     if let user = FIRAuth.auth()?.currentUser {
//        
//        user.updateEmail(email.text!, completion: { (error) in
//            
//            let credential = FIREmailPasswordAuthProvider.credentialWithEmail(self.email.text!,password: self.password.text!)
//            
//            print(credential)
//            if let error = error{
//                print(error.localizedDescription)
//            }else{
//               
//                
//                let alertView = UIAlertView(title: "Update Email", message: "email Updated", delegate: self, cancelButtonTitle: "Ok")
//                alertView.show()
//                }
//             })
//        self.e_mail = self.email.text
//        print(self.e_mail)
//       }
//        }
//        
//        let updatenote = UserDetails(username: user_name!, firstname: first_name!, lastname: last_name!, email: e_mail!, phno: ph_no!)
//        
//
////         let updatenote = UserDetails(email: e_mail!)
//        print(updatenote)
//        
//        
//        let key = user!.ref!.key
//        print(key)
//        
//        let updateRef = rootRef.child("/users/\(key)")
//       
//        
//        updateRef.updateChildValues(updatenote.toAnyObject())
//        navigationController?.popViewControllerAnimated(true)
//        
    
        }
        
    
    
    func changeemail()
    {
        
        
        if let user = FIRAuth.auth()?.currentUser {
        
            
            FIRAuth.auth()?.currentUser?.updateEmail(email.text!) { (error) in
                    if let error = error{
                        print(error.localizedDescription)
                    }else{
                      let alertView = UIAlertView(title: "Update Email", message: "email Updated", delegate: self, cancelButtonTitle: "Ok")
                                alertView.show()
                                }
                             }
            
                   }
        
            
            //        rootRef.changeEmailForUser(user.email, password: "correctpassword",
//            toNewEmail: "newEmail", withCompletionBlock: { error in
//                if error != nil {
//                    
//                    print("There was an error processing the request")
//                    // There was an error processing the request
//                } else {
//                    
//                    print("Email changed successfully")
//                    
//                    // Email changed successfully
//                }
//        })
//
    }
    
    
    
    func reauthenticate(){
  
        let user = FIRAuth.auth()?.currentUser
//        var credential: FIRAuthCredential
        let credential = FIREmailPasswordAuthProvider.credentialWithEmail(email.text!, password: password.text!)
        // Prompt the user to re-provide their sign-in credentials
        user?.reauthenticateWithCredential(credential) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User re-authenticated.")
            }
        }
        
    }
    
    
//    func change() {
//        
//    let user = FIRAuth.auth()?.currentUser
//    var credential: FIRAuthCredential
//    
//    user?.reauthenticateWithCredential(credential) { error in
//    if let error = error {
//           print(error.localizedDescription)
//        } else {
    //       FIRAuth.auth()?.currentUser?.updateEmail(email.text!, completion: { (error) in
//          print(credential)
//                 if let error = error{
//                print(error.localizedDescription)
//             }else{
//             let  alertView = UIAlertView(title: "Update Email", message: "email Updated",                delegate: self, cancelButtonTitle: "Ok")
//              alertView.show()
//             }
//          })
//        }
//    }
//    }
//
//
//


}







//@IBAction func resetPswd(sender: AnyObject)
//{
//
//
//    //            user.updatePassword(password.text!, completion: {(error) in
//    //
//    //                if let error = error{
//    //                    print(error.localizedDescription)
//    //                }else{
//    //                    let alertView = UIAlertView(title: "updatePassword", message: "Passowrd Updated", delegate: self, cancelButtonTitle: "ok")
//    //                    alertView.show()
//    //                }
//    //            })
//    
//}






//    @IBAction func updateemail(sender: AnyObject) {
//
//
//        if let user = FIRAuth.auth()?.currentUser {
//
//            user.updateEmail(email.text!, completion: { (error) in
//
////                let credential = FIREmailPasswordAuthProvider.credentialWithEmail(self.email.text!,password: self.password.text!)
//
////                print(credential)
//                if let error = error{
//                    print(error.localizedDescription)
//                }else{
//
//
//                    let alertView = UIAlertView(title: "Update Email", message: "email Updated", delegate: self, cancelButtonTitle: "Ok")
//                    alertView.show()
//                }
//            })
//            self.e_mail = self.email.text
//            print(self.e_mail)
//
//    }

//}












  