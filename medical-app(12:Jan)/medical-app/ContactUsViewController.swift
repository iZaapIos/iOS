//
//  ContactUsViewController.swift
//  medical-app
//
//  Created by Administrator on 22/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import MessageUI

class ContactUsViewController: UIViewController,MFMailComposeViewControllerDelegate,UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var MailTextField: UITextField!
    @IBOutlet var SubjTextField: UITextField!
    @IBOutlet var PhTextField: UITextField!
    @IBOutlet var MessageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MessageTextView.delegate = self
        NameTextField.delegate = self
        MailTextField.delegate = self
        SubjTextField.delegate = self
        PhTextField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        NameTextField.resignFirstResponder()
        MailTextField.resignFirstResponder()
        SubjTextField.resignFirstResponder()
        PhTextField.resignFirstResponder()
        return true
    }
    @IBAction func SendRequest(sender: UIButton)
    {
        
     if let mailVC: MFMailComposeViewController = MFMailComposeViewController() {
       mailVC.mailComposeDelegate = self
       mailVC.setSubject(SubjTextField.text!)
        
         let email = MailTextField.text!.lowercaseString
        let finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        let mailContent = "Name: \(NameTextField.text!)\n\n Subject:  \(SubjTextField.text!)\n\n Email: \(finalEmail)\n\n Message: \(MessageTextView.text!)"
        
        mailVC.setMessageBody(mailContent, isHTML: false)
        
        let toRecipient = "izaaptec@gmail.com"
        
        mailVC.setToRecipients([toRecipient])
        
        self.presentViewController(mailVC, animated: true){
            
            self.NameTextField.text = ""
            self.MailTextField.text = ""
            self.PhTextField.text = ""
            self.MessageTextView.text = ""
        }
       }
     }
     
    
    func  mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
 }
