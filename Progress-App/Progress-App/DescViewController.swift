//
//  DescViewController.swift
//  Progress-App
//
//  Created by Administrator on 10/08/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class DescViewController: UIViewController,UITextViewDelegate {
    
   
    var content: String?
    var titlename: String?
    var TextPlaceHolder:UILabel?

    @IBOutlet weak var TitleTextField: UITextField!
    @IBOutlet weak var ContentTextField: UITextView!
    
    var rootRef = FIRDatabase.database().reference()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        clear()
    }

    
    @IBAction func save_action(sender: AnyObject)
    {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)

          titlename = TitleTextField.text!
          content = ContentTextField.text
        
        
        let note: NSDictionary = ["title":titlename!,"content":content!,"date":todayDate]
        
        //add firebase child node
        let profile = rootRef.childByAppendingPath(title!)
        rootRef.childByAppendingPath("content")
        rootRef.childByAppendingPath("date")
        
        profile.setValue(note)
        
        navigationController?.popViewControllerAnimated(true)
       
    }
    
    
    func clear()
    {
        ContentTextField!.delegate = self
        TextPlaceHolder = UILabel()
        TextPlaceHolder!.text = "Enter Note text here..."
        TextPlaceHolder!.font = UIFont.italicSystemFontOfSize(ContentTextField!.font!.pointSize)
        TextPlaceHolder!.sizeToFit()
        ContentTextField!.addSubview(TextPlaceHolder!)
        TextPlaceHolder!.frame.origin = CGPointMake(10, ContentTextField!.font!.pointSize / 2)
        TextPlaceHolder!.textColor = UIColor(white: 0, alpha: 0.3)
        TextPlaceHolder!.hidden = !TitleTextField!.text!.isEmpty
    }
    
    
    func textViewDidChange(textView: UITextView)
    {
        TextPlaceHolder!.hidden = !textView.text.isEmpty
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    
}
