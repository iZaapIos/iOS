//
//  UpdateTblViewController.swift
//  Progress-App
//
//  Created by Administrator on 13/09/16.
//  Copyright © 2016 Administrator. All rights reserved.
//
import UIKit
import Firebase

class UpdateViewController: UIViewController,UITextViewDelegate {
   
    
    var content: String?
    var titlename: String?
    var TextPlaceHolder:UILabel?
    
    var note:Note?
    
    @IBOutlet weak var TitleTextField: UITextField?
    @IBOutlet weak var ContentTextField: UITextView?
    
    var rootRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "orange-bg")!)
    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        TitleTextField!.text = note!.title
        ContentTextField!.text = note!.content
        
        
//        clear()
    }
    
    
    @IBAction func save_action(sender: AnyObject)
    {
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        
        
        
        
        if TitleTextField!.text == ""{
            TitleTextField!.text = "enter title"
        }else{
            titlename = TitleTextField!.text!
        }
        
        if ContentTextField!.text == ""{
            ContentTextField!.text = "enter your note"
        }else{
            content = ContentTextField?.text
        }
        let updatenote = Note(title: titlename!,content: content!, date: todayDate)
        
        print(updatenote)
        let key = note!.ref!.key
        print(key)
        
        let updateRef = rootRef.child("/note/\(key)")
        
        updateRef.updateChildValues(updatenote.toAnyObject())

        navigationController?.popViewControllerAnimated(true)
        
        
    }
    
    
//    func clear()
//    {
//        ContentTextField!.delegate = self
//        TextPlaceHolder = UILabel()
//        TextPlaceHolder!.text = "Enter Note text here..."
//        TextPlaceHolder!.font = UIFont.italicSystemFontOfSize(ContentTextField!.font!.pointSize)
//        TextPlaceHolder!.sizeToFit()
//        ContentTextField!.addSubview(TextPlaceHolder!)
//        TextPlaceHolder!.frame.origin = CGPointMake(10, ContentTextField!.font!.pointSize / 2)
//        TextPlaceHolder!.textColor = UIColor(white: 0, alpha: 0.3)
//        TextPlaceHolder!.hidden = !TitleTextField!.text!.isEmpty
//    }
    
    
    func textViewDidChange(textView: UITextView)
    {
        TextPlaceHolder!.hidden = !textView.text.isEmpty
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
}

    
        
    
    

