//
//  ViewController.swift
//  Progress-App
//
//  Created by Administrator on 09/08/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

class TblViewController: UITableViewController {

    // Properties
    var update: UpdateViewController? = nil
    var items = [Note]()
    var filtrdItems = [Note]()
    let searchController = UISearchController(searchResultsController: nil)

    var databaseRef: FIRDatabaseReference!
    var refControl = UIRefreshControl()
    
       override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "orange-bg"))
        
        
        //setup search controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        // set up the refresh control
        self.refControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refControl.addTarget(self, action: "refresh:", forControlEvents: UIControlEvents.ValueChanged)
        self.tableView?.addSubview(refControl)
        

    }

    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
            loadDataFromFirebase()

       
        
        
    }
    
    func refresh(sender:AnyObject) {
        self.loadDataFromFirebase()
    }
    

    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.active && searchController.searchBar.text != "" {
            
            return self.filtrdItems.count
        }
            return self.items.count
      }
    
     override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
       let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        var note : Note
        
        if searchController.active && searchController.searchBar.text != "" {
              note = filtrdItems[indexPath.row]
        } else {
              note = items[indexPath.row]
        }
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.date
        return cell
        
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All")
    {
        
        filtrdItems = items.filter({( note : Note) -> Bool in
            let categoryMatch = (scope == "All") || (note.title == scope)
            return categoryMatch && note.title.lowercaseString.containsString(searchText.lowercaseString)
        })
        tableView.reloadData()
        
    }
    

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {

            // Delete the row from the data source
            let ref = items[indexPath.row].ref
            ref!.removeValue()
            items.removeAtIndex(indexPath.row)
            
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }

    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "editSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let note: Note
                if searchController.active && searchController.searchBar.text != "" {
                    note = filtrdItems[indexPath.row]
                } else {
                    note = items[indexPath.row]
                }
     
            var vc = segue.destinationViewController as! UpdateViewController
            let indexPath = tableView.indexPathForSelectedRow!
            
            vc.note = items[indexPath.row]
            
           }
        
         }
        
      }

    
    func loadDataFromFirebase() {
        
        databaseRef = FIRDatabase.database().reference().child("note")
        
        databaseRef.observeEventType(.Value, withBlock: { (snapshot) in
            
            var newItems = [Note]()
            
            for item in snapshot.children {
                
                let newNote = Note(snapshot: item as! FIRDataSnapshot)
                newItems.insert(newNote, atIndex: 0)
                
            }
            self.items = newItems
            
            // tell refresh control it can stop showing up now
            if self.refControl.refreshing
            {
                self.refControl.endRefreshing()
            }
            
            
            self.tableView.reloadData()
            
            }) { (error) in
                print(error.localizedDescription)
                 self.tableView.reloadData()
        }
        
    }
    
}


extension TblViewController: UISearchBarDelegate {
        // MARK: - UISearchBar Delegate
        func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        }
    }
extension TblViewController: UISearchResultsUpdating{
    func updateSearchResultsForSearchController(searchController: UISearchController){
        filterContentForSearchText(searchController.searchBar.text!)
    }
}







