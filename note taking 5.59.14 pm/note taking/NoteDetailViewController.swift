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
    
        
        
        
        
        
        
        
        
//       var error:NSError?
//
//        
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
//        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
//        let date = NSDate()
//        let todayDate = dateFormatter.stringFromDate(date)
        
// old part
        
//        let context : NSManagedObjectContext = moContext.managedObjectContext
//        
//        //Ns object created to insert the data into coredata
//        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as NSManagedObject
//        }
//        
//        //assigning the entered value to the field in the DB
//        newUser.setValue(TitleTextField!.text, forKey: "descrip")
//         print(newUser)
//        
//        newUser.setValue(NoteTextField!.text, forKey: "content")
//        newUser.setValue(todayDate, forKey: "date")
        
        // end of old part
//
//        if note == nil
//        {
//        
//            let noteDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: moContext)
//            
//            
//            // Then, We Create the Managed Object to be  inserted into the cored data
//          note = Note(entity: noteDescription!, insertIntoManagedObjectContext: moContext)
//
//        }
//    
//        
//  
//        note?.setValue(TitleTextField!.text, forKey: "descrip")
//        note?.setValue(NoteTextField!.text, forKey: "content")
//        note?.setValue(todayDate, forKey: "date")
//
//        
//        do
//        {
//            try moContext.save()
//
//            if let err = error
//            {
//                let errAlert = UIAlertView(title:"Error",message:err.localizedFailureReason,delegate: nil,cancelButtonTitle:"OK")
//                errAlert.show()
//            }
//            else
//            {
//                let errAlert = UIAlertView(title:"SUCCESS",message:"Your Note is saved",delegate:nil,cancelButtonTitle:"OK")
//                errAlert.show()
//            }
//
//        }
//        catch
//        {
//            // handle errorA
//        }
////        print(newUser)
//        
//
//        print("Object Saved.")
//        TitleTextField!.text = ""
//        NoteTextField!.text = ""
//        clear()
//    }
    
    func createNewItem() {
        
          var error:NSError?
        
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        
        
        let entityDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: moContext)
        
        let note = Note(entity: entityDescription!, insertIntoManagedObjectContext: moContext)
        
        note.descrip = TitleTextField.text
        note.content = NoteTextField.text
        note.setValue(todayDate, forKey: "date")
        
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
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        

        note!.descrip = TitleTextField.text
        note!.content = NoteTextField.text
        note!.setValue(todayDate, forKey: "date")
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
}

    


