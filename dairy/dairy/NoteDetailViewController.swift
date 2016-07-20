//
//  ViewController.swift
//  dairy
//
//  Created by Administrator on 18/07/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController,UITextViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var NoteTextField: UITextView!
    
    @IBOutlet weak var TitleTextField: UITextField!
    
    
    var TextPlaceHolder:UILabel?
    var note:Note?
    var error:NSError?
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let n = note
        {
            NoteTextField.text = n.content
            TitleTextField.text = n.descrip
            
        }
        clear()
        
    }
    
    @IBAction func SaveButton(sender: AnyObject)
    {
        let dateFormatter = NSDateFormatter()
            dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
            dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
            let date = NSDate()
            let todayDate = dateFormatter.stringFromDate(date)
        
        if note == nil
        {
            let storeDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: moContext)
            
            
            // Then, We Create the Managed Object to be  inserted into the cored data
            note = Note(entity: storeDescription!, insertIntoManagedObjectContext: moContext)
        }
        
        // set the attributes
        note!.descrip = TitleTextField.text
        note!.content = NoteTextField.text
        note!.setValue(todayDate, forKey: "date")

        
        
        // Finally we issue the command to save the data
        var error: NSError?
        
        
        do {
            // Save The object
            
            try moContext.save()
        } catch var error1 as NSError {
            error = error1
        }
        
        
        //Check if there is any erros
        
        if let err = error {
            
            let a = UIAlertView(title: "Error", message: err.localizedFailureReason, delegate: nil, cancelButtonTitle: "OK")
            a.show()
            
        } else {
            
            let a = UIAlertView(title: "Success", message: "Your Record is saved", delegate: nil, cancelButtonTitle: "OK")
            a.show()
//            
//            self.hideKB(self)
////
            
                   }
        
    }
    
//    func createNewItem() {
//    
//    //  var error:NSError?
//    
//    
//    let dateFormatter = NSDateFormatter()
//    dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
//    dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
//    let date = NSDate()
//    let todayDate = dateFormatter.stringFromDate(date)
//    
//    
//    let entityDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: moContext)
//    
//    let note = Note(entity: entityDescription!, insertIntoManagedObjectContext: moContext)
//    
//    note.descrip = TitleTextField.text
//    note.content = NoteTextField.text
//    note.setValue(todayDate, forKey: "date")
//    
//    print(note.descrip)
//    
//       do {
//        try moContext.save()
//    
//         if let err = error
//            {
//                let errAlert = UIAlertView(title:"Error",message:err.localizedFailureReason,delegate: nil,cancelButtonTitle:"OK")
//                errAlert.show()
//            }
//         else{
//                let errAlert = UIAlertView(title:"SUCCESS",message:"Your Note is saved",delegate:nil,cancelButtonTitle:"OK")
//                errAlert.show()
//            }
//        } catch {
//            return
//            }
//    }
//    
//    func editItem() {
//        
//        // var error:NSError?
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
//        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
//        let date = NSDate()
//        let todayDate = dateFormatter.stringFromDate(date)
//        
//        
//        note!.descrip = TitleTextField.text
//        note!.content = NoteTextField.text
//        note!.setValue(todayDate, forKey: "date")
//        
//        print(note!.descrip)
//        do {
//            try moContext.save()
//            if let err = error
//            {
//                let errAlert = UIAlertView(title:"Error",message:err.localizedFailureReason,delegate: nil,cancelButtonTitle:"OK")
//                errAlert.show()
//            }
//            else
//            {
//                let errAlert = UIAlertView(title:"UPDATE",message:"Your Note is Edited",delegate:nil,cancelButtonTitle:"OK")
//                errAlert.show()
////                self.hideKB(self)
//                
//            }
//            
//        } catch {
//            return
//        }
//        
//    }
    
    func clear()
    {
        NoteTextField!.delegate = self
        TextPlaceHolder = UILabel()
        TextPlaceHolder!.text = "Enter Note text here..."
        TextPlaceHolder!.font = UIFont.italicSystemFontOfSize(NoteTextField!.font!.pointSize)
        TextPlaceHolder!.sizeToFit()
        NoteTextField!.addSubview(TextPlaceHolder!)
        TextPlaceHolder!.frame.origin = CGPointMake(10, NoteTextField!.font!.pointSize / 2)
        TextPlaceHolder!.textColor = UIColor(white: 0, alpha: 0.3)
        TextPlaceHolder!.hidden = !TitleTextField!.text!.isEmpty
    }
    
    
    func textViewDidChange(textView: UITextView)
    {
        TextPlaceHolder!.hidden = !textView.text.isEmpty
    }
    
//    @IBAction func hideKB(sender: AnyObject) {
//        
//        
//        for v in self.view.subviews
//        {
//            if v.isKindOfClass(UITextField)
//            {
//                v.resignFirstResponder()
//            }
//            
//        }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        TitleTextField.resignFirstResponder()
        NoteTextField.resignFirstResponder()
        
        
    }
}

