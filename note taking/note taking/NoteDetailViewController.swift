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
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


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
        let app: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = NSDate()
        let todayDate = dateFormatter.stringFromDate(date)
        
        
        
        let context : NSManagedObjectContext = app.managedObjectContext
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as NSManagedObject
       // newUser.setValue(TitleTextField!.text, forKey: "date")
        newUser.setValue(NoteTextField!.text, forKey: "descrip")
        newUser.setValue(todayDate, forKey: "date")
        do
        {
            try context.save()
        }
        catch
        {
            // handle errorA
        }
        print(newUser)
        print("Object Saved.")
        NoteTextField.text = ""
        clear()
        
        /*
        if note == nil
        {
            let storeDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: managedObjectContext)
            note = Note(entity: storeDescription!, insertIntoManagedObjectContext: managedObjectContext)
        }
        
        //change the date value into string
        let time = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:sssss"
        let formatteddate = formatter.stringFromDate(time)
        
        note!.descrip = NoteTextField.text!
        note!.date = formatteddate
        var error:NSError?
        do
        {
            try note!.managedObjectContext!.save()
        }
        catch let error1 as NSError
        {
            error = error1
        }
        //to check errors
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
        NoteTextField.text = ""
        clear()
 */
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

    


