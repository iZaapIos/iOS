//
//  DisplayViewController.swift
//  OCR_App
//
//  Created by Administrator on 02/09/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class DisplayViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var DisplayText: UITextView!
    
    var txt = [Text]()
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

    
       
        let fetchRequest = NSFetchRequest(entityName: "Text")
        
        
        let request = NSFetchRequest(entityName:"Text")
        txt  = (try! moContext.executeFetchRequest(request)) as! [Text]
        
            for t_txt in txt
            {
                print(t_txt)
                DisplayText.text = t_txt.retreivedText
            }
        
    }

    

}
