//
//  SignUpViewController.swift
//  medical-app
//
//  Created by Administrator on 07/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class LogInViewController: UIViewController {
    
    @IBOutlet weak var EmailTextField: UITextField!

    @IBOutlet weak var PasswordTextField: UITextField!
    let userRegister = UserInfo()
    
    
    @IBAction func LogIn(sender: AnyObject)
    {
        if self.EmailTextField.text == "" || self.PasswordTextField.text == ""
        {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
        
        userRegister.signIn(EmailTextField.text!, password: PasswordTextField.text!)
        }
//         userRegister.moveToLogMed()
        
        
    }
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        EmailTextField.resignFirstResponder()
        PasswordTextField.resignFirstResponder()
    }

}
