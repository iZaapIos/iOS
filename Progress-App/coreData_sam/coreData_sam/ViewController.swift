//
//  ViewController.swift
//  coreData_sam
//
//  Created by Administrator on 08/06/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
        @IBOutlet weak var tblVw: UITableView!
    
    var names = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Employee List\""
        tblVw.registerClass(UITableViewCell.self,
            forCellReuseIdentifier: "Cell")
    
        
    }

    
    @IBAction func insert_but(sender: AnyObject)
    {
        let alert = UIAlertController(title: "New Name",
            message: "Add a new name",
            preferredStyle: .Alert)
        
        let saveAction = UIAlertAction(title: "Save",
            style: .Default,
            handler: { (action:UIAlertAction) -> Void in
                
                let textField = alert.textFields!.first
                self.names.append(textField!.text!)
                self.tblVw.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel",
            style: .Default) { (action: UIAlertAction) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler {
            (textField: UITextField) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,
            animated: true,
            completion: nil)
        
        
        
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return names.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
     let cell = tblVw.dequeueReusableCellWithIdentifier("Cell")
            
    cell!.textLabel!.text = names[indexPath.row]
            print(names)
            
            return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

