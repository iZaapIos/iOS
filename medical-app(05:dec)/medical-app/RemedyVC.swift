
//  RemedyVC.swift
//  medical-app
//
//  Created by Administrator on 05/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit

class RemedyVC: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
    var remedy = ["Driking Water","Heating Pad","Warm Shower","Checked Temperature","Taken Nap","Taken Medications"] as NSMutableArray
    var selectedremedy = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
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
        cell.textLabel?.text = String(contact)
        cell.checkButton.addTarget(self, action: "tickClicked",forControlEvents: UIControlEvents.TouchUpInside)
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
        
        print("Selecetd Array \(selectedremedy)")
        
        tableView.reloadData()
        
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) ->CGFloat
//    {
//        return 80.0
//    }
//    

}
