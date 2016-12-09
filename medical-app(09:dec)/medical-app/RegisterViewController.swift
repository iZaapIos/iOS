//
//  ViewController.swift
//  medical-app
//
//  Created by Administrator on 07/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var PhNo: UITextField!
    @IBOutlet weak var Password: UITextField!
    let userRegister = UserInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Register(sender: AnyObject)
    {
        if self.Email.text == "" || self.Password.text == ""
        {
            
            
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email and password.", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else  {
            
        userRegister.signUp(Email.text!, username: UserName.text!, password: Password.text!, firstname: FirstName.text!, lastname: LastName.text!, phno: PhNo.text!)
            
            
//            self.performSegueWithIdentifier("registeredin",sender:nil)
}
        
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        Email.resignFirstResponder()
        FirstName.resignFirstResponder()
        LastName.resignFirstResponder()
        UserName.resignFirstResponder()
        PhNo.resignFirstResponder()
        
    }
    
    

}

