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

    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var notes = [Note]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        let request = NSFetchRequest(entityName:"Note")
        notes  = (try! managedObjectContext.executeFetchRequest(request)) as! [Note]
        NSLog("%@", notes)
        for n_notes in notes
        {
            print(n_notes.descrip)
            print(n_notes.content)
        }
    }
    
    
    
    //tableview delegates
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return notes.count
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        navigationItem.title = nil
        
        if segue.identifier! == "editSegue" {
            let noteDetailViewController = segue.destinationViewController as! NoteDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow
            noteDetailViewController.note = notes[selectedIndexPath!.row]
        } else if segue.identifier! == "viewSegue" {
            let note = Note()
            notes.append(note)
            let noteDetailViewController = segue.destinationViewController as! NoteDetailViewController
            noteDetailViewController.note = note
        }
    }
    
        
        override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            notes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }

    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

