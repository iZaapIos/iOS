//
//  ResetPasswordViewController.swift
//  medical-app
//
//  Created by Administrator on 13/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var EmailTextField: UITextField!
    let userRegister = UserInfo()
    
    @IBAction func ResetPswd(sender: UIButton)
    {
        userRegister.resetPassword(EmailTextField.text!)
    }
}
