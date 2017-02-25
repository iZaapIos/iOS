
//  RemedyVC.swift
//  medical-app
//
//  Created by Administrator on 05/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class RemedyViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    var RateRev: String?
    var CmtRev: String?
    let medic = [medlist]()
    
    
    
    var remedy = ["Driking Water","Heating Pad","Warm Shower","Checked Temperature","Taken Nap","Taken Medications"] as NSMutableArray
    var selectedremedy = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
         return remedy.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
    let  contact = remedy.objectAtIndex(indexPath.row)
        let cell:checkboxCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! checkboxCell
        cell.remedyLbl.text = String(contact)
        cell.checkButton.addTarget(self, action: "tickClicked:",forControlEvents: UIControlEvents.TouchUpInside)
        cell.checkButton.tag = indexPath.row
        
        if selectedremedy.containsObject(remedy.objectAtIndex(indexPath.row)){
            cell.checkButton.setBackgroundImage(UIImage(named: "Checked_Checkbox.png"), forState: UIControlState.Normal)
        }else{
            cell.checkButton.setBackgroundImage(UIImage(named: "Unchecked_Checkbox.png"), forState: UIControlState.Normal)
        }
        return cell
        
    }
    
    func tickClicked(sender: UIButton!)
    {
        let value = sender.tag;
        
        if selectedremedy.containsObject(remedy.objectAtIndex(value))
        {
            selectedremedy.removeObject(remedy.objectAtIndex(value))
        }
        else
        {
            selectedremedy.addObject(remedy.objectAtIndex(value))
        }
        
        var remedyStr = selectedremedy.description // converting the array into string
        remedyStr = remedyStr.stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil) // string without quotes
         print(remedyStr)
        
        tableView.reloadData()
        
    }
}
