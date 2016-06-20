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
    var note :Note?
    
    
   
    //object created to access to the app Delegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


    override func viewDidLoad() {
        super.viewDidLoad()
        
        clear()
        }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func SaveButton(sender: AnyObject)
    {
        //get the description of the entity
        let noteDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: managedObjectContext)
        
        //thn ,v create the managed object to insert into the coredata

        let note = Note(entity:noteDescription!,insertIntoManagedObjectContext: managedObjectContext)
    
        //set the attribute value
        note.descrip = TitleTextField.text
        
        //command to save the data
        var error:NSError?
        
        
        do {
            // Save The object
            
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
        //to check errors
        if let err =  error
        {
            let errAlert = UIAlertView(title:"Error",message:err.localizedFailureReason,delegate: nil,cancelButtonTitle:"OK")
            errAlert.show()
        }else{
            let errAlert = UIAlertView(title:"SUCCESS",message:" Your Note is saved",delegate:nil,cancelButtonTitle:"OK")
            errAlert.show()
           
            
            }
        
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
    
    func textViewDidChange(textView: UITextView) {
        TextPlaceHolder!.hidden = !textView.text.isEmpty
    }

    
    
    
    }

    


