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
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "orange-bg")!)
    }
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
            let noteDescription = NSEntityDescription.entityForName("Note", inManagedObjectContext: moContext)
            
            
            // Then, We Create the Managed Object to be  inserted into the cored data
            note = Note(entity: noteDescription!, insertIntoManagedObjectContext: moContext)
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
            
            let erralert = UIAlertView(title: "Error", message: err.localizedFailureReason, delegate: nil, cancelButtonTitle: "OK")
            erralert.show()
            
        } else {
            
            let erralert = UIAlertView(title: "Success", message: "Your Record is saved", delegate: nil, cancelButtonTitle: "OK")
            erralert.show()
            
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let NoteDetailViewController = storyboard.instantiateViewControllerWithIdentifier("ContentVC") as UIViewController
        navigationController?.pushViewController(NoteDetailViewController, animated: true)
        
        clear()

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
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        TitleTextField.resignFirstResponder()
        NoteTextField.resignFirstResponder()
        }
}
    


