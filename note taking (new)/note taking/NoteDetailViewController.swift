//
//  NoteDetailViewController.swift
//  note taking
//
//  Created by Administrator on 14/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class NoteDetailViewController: UIViewController,UITextViewDelegate{
    
    //outlet for the UI objects on DetailVC
    
    @IBOutlet weak var NoteTextField: UITextView!
    
    @IBOutlet weak var TitleTextField: UITextField!
    
    var TextPlaceHolder:UILabel?
    var note:Note?
    var error:NSError?
    
        let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


    override func viewDidLoad()
    {
        super.viewDidLoad()
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)
        self.view.endEditing(true)
          
        
        
       if let n = note
        {
            NoteTextField.text = n.content
            TitleTextField.text = n.descrip
            
        }
        clear()
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func SaveButton(sender: AnyObject)
    {
        if note != nil {
            editItem()
        } else {
            createNewItem()
        }
        
        TitleTextField!.text = ""
        NoteTextField!.text = ""
        clear()
    }

        
        
        
        
        
    func createNewItem() {
        
//        var error:NSError?
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        
        
        let entityDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: moContext)
        
        let note = Note(entity: entityDescription!, insertIntoManagedObjectContext: moContext)
        
        note.descrip = TitleTextField.text
        note.content = NoteTextField.text
        note.setValue(todayDate, forKey: "date")
        
        print(note.descrip)
        
        do {
            try moContext.save()
            
            if let err = error
            {
                let errAlert = UIAlertView(title:"Error",message:err.localizedFailureReason,delegate: nil,cancelButtonTitle:"OK")
                errAlert.show()
            }
            else
            {
                let errAlert = UIAlertView(title:"SUCCESS",message:"Your Note is saved",delegate:nil,cancelButtonTitle:"OK")
                errAlert.show()
                           }
        } catch {
            return
        }
        
    }
    
    func editItem() {
        
//        var error:NSError?
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        
        
        note!.descrip = TitleTextField.text
        note!.content = NoteTextField.text
        note!.setValue(todayDate, forKey: "date")
        
        print(note!.descrip)
        do {
            try moContext.save()
            if let err = error
            {
                let errAlert = UIAlertView(title:"Error",message:err.localizedFailureReason,delegate: nil,cancelButtonTitle:"OK")
                errAlert.show()
            }
            else
            {
                let errAlert = UIAlertView(title:"UPDATE",message:"Your Note is Edited",delegate:nil,cancelButtonTitle:"OK")
                errAlert.show()
                self.hideKB(self)
                
            }
            
        } catch {
            return
        }
        
    }

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
    
    
    
    @IBAction func hideKB(sender: AnyObject) {
        
        
        for v in self.view.subviews
        {
            if v.isKindOfClass(UITextView)
            {
                v.resignFirstResponder()
            }
            
        }
}
}
    


