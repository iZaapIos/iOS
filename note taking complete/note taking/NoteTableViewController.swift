                                                                             //
//  ViewController.swift
//  note taking
//
//  Created by Administrator on 14/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import CoreData

class NoteTableViewController: UITableViewController
{

    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var notes = [Note]()
    var filtrdNotes = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.tableView.backgroundView = UIImageView(image: UIImage(named: "orange-bg"))
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let request = NSFetchRequest(entityName:"Note")
        notes  = (try! moContext.executeFetchRequest(request)) as! [Note]
        NSLog("%@", notes)
        
        navigationItem.backBarButtonItem =  nil
        
        for n_notes in notes
        {
            print(n_notes.descrip)
            print(n_notes.content)
        }
        self.tableView.reloadData()
        
    }

    
    //tableview delegates
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return self.notes.count
    }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
     {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let n_note = notes[indexPath.row]
        cell.textLabel!.text = n_note.descrip
        print(n_note.descrip)
        cell.detailTextLabel?.text = n_note.date
        return cell
    }
    
    // code for segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        navigationItem.title = nil
        
        if segue.identifier! == "editSegue"
        
        {
            let noteDetailViewController = segue.destinationViewController as! NoteDetailViewController
            
            let selectedIndexPath = self.tableView.indexPathForSelectedRow
            noteDetailViewController.note = notes[selectedIndexPath!.row]
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            // remove the deleted item from the model
            let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context:NSManagedObjectContext = appDel.managedObjectContext
            context.deleteObject(notes[indexPath.row] )
            notes.removeAtIndex(indexPath.row)
            do {
                try context.save()
            } catch _ {
            }
            
            // remove the deleted item from the `UITableView`
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        default:
            return
        }
    }
    
        
// to search the note by title
    
    func filterNotes(searchText: String)
    {
        
        var error:NSError?
        
        let request = NSFetchRequest(entityName: "Note")
        
        let predicate = NSPredicate(format: "descrip  contains %@", searchText)
        
        request.predicate = predicate
        
        notes  = (try! moContext.executeFetchRequest(request)) as! [Note]
        
        self.tableView.reloadData()
        
    }


    
    @IBAction func searchRecords(sender: AnyObject) {
        
        // create the alert controller
        
        let SearchAlert = UIAlertController(title: "Search", message: "Enter enter part of note name", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        // Add the text field
        
        SearchAlert.addTextFieldWithConfigurationHandler { (noteName:UITextField!) -> Void in
            
            noteName.placeholder = "Note Title"
            
        }
        
        
        // Create the button - Alert Action
        
        let okAc = UIAlertAction(title: "Search", style: UIAlertActionStyle.Default)
            { (alert: UIAlertAction) in
                
                let noteName = SearchAlert.textFields![0]
                
                self.filterNotes(noteName.text!)
                
                SearchAlert.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
        // Add it to the controller
        
        SearchAlert.addAction(okAc)
        
        
        // only one cancel action style allowed
        
        let cancelAc = UIAlertAction(title: "cancel", style: UIAlertActionStyle.Cancel) { (alert: UIAlertAction) in
            
            SearchAlert.dismissViewControllerAnimated(true, completion: nil)
            
        }
        
        SearchAlert.addAction(cancelAc)
        
        presentViewController(SearchAlert, animated: true , completion: nil)
        
        
    }
    

}

