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
   
    //object created to access to the app Delegate
//    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
        let moContext = UIApplication.sharedApplication().delegate as! AppDelegate



    override func viewDidLoad()
    {
        super.viewDidLoad()
        clear()
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func SaveButton(sender: AnyObject)
    {
        
        var error:NSError?

        
//        let app: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        
        
        
        let context : NSManagedObjectContext = moContext.managedObjectContext
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as NSManagedObject
       // newUser.setValue(TitleTextField!.text, forKey: "date")
        
        newUser.setValue(NoteTextField!.text, forKey: "descrip")
        newUser.setValue(todayDate, forKey: "date")
        
        do
        {
            try context.save()
//            var error:NSError?

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

        }
        catch
        {
            // handle errorA
        }
        print(newUser)
        

        print("Object Saved.")
        NoteTextField.text = ""
        clear()
    }
    
    
    
    func clear()
    {
        NoteTextField.delegate = self
        TextPlaceHolder = UILabel()
        TextPlaceHolder!.text = "Enter Note text here..."
        TextPlaceHolder!.font = UIFont.italicSystemFontOfSize(NoteTextField.font!.pointSize)
        TextPlaceHolder!.sizeToFit()
        NoteTextField.addSubview(TextPlaceHolder!)
        TextPlaceHolder!.frame.origin = CGPointMake(5, NoteTextField.font!.pointSize / 2)
        TextPlaceHolder!.textColor = UIColor(white: 0, alpha: 0.3)
        TextPlaceHolder!.hidden = !NoteTextField.text.isEmpty
    }
    
    
    func textViewDidChange(textView: UITextView)
    {
        TextPlaceHolder!.hidden = !textView.text.isEmpty
    }
}

    


