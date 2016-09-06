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
    
    @IBOutlet weak var DisplayText: UILabel!
    
    var t_txt = [Text]()
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()

    override func viewWillAppear(animated: Bool)
        
    {
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        do {
            try fetchedResultController.performFetch()
        } catch _ {
        }
    }
    
    
    func getFetchedResultController() ->NSFetchedResultsController {
    fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: moContext, sectionNameKeyPath: nil, cacheName: nil)
    return fetchedResultController
    }
    
    
    func taskFetchRequest()->NSFetchRequest {
    let fetchRequest = NSFetchRequest(entityName: "Text")
    let sortDescriptor = NSSortDescriptor(key: "retreivedText", ascending: true)
    fetchRequest.sortDescriptors = [sortDescriptor]
    return fetchRequest
    }

}
