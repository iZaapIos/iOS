//
//  UserTableViewController.swift
//  sam2_using_firebase
//
//  Created by Administrator on 29/07/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UserTableViewController: UITableViewController {

    var ref : FIRDatabaseReference!
    var refHandle: UInt!
    var userList = [User]()
    
    let cellId = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = FIRDatabase.database().reference()
        fetchUsers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    // MARK: - Table view data source

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userList.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)

        cell.textLabel?.text = userList[indexPath.row].email

        return cell
    }
    
    func fetchUsers()
    {
        
        refHandle = ref.child("UserAcc").observeEventType(.ChildAdded, withBlock: { (snapshot) in
            if let dictionary = snapshot.value as? [String : AnyObject]
            {
                
             print(dictionary)
        
            let user = User()
            
        user.setValuesForKeysWithDictionary(dictionary)
            self.userList.append(user)
                
                dispatch_async(dispatch_get_main_queue(),{
                    self.tableView.reloadData()
                })
                
                }
            
        })
        
        
    }


}
