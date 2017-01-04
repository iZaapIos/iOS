//
//  ClinicianContactViewController.swift
//  medical-app
//
//  Created by Administrator on 28/12/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase

//class ClinicianContactViewController: UIViewController {
    class ClinicianContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var values = ["Physician", "Pharmacist", "Nurse", "Physician Assistant","Clinical Researcher"]
    let cellReuseIdentifier = "cell"
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
        
     @IBOutlet weak var clinTextField:UITextField!
    @IBOutlet  weak var tableview: UITableView!
    
    @IBOutlet var clinName: UITextField!
    @IBOutlet var clinEmail: UITextField!
    @IBOutlet var clinNum: UITextField!
    var clin:Clinician?
    
    // If user changes text, hide the tableView
    @IBAction func textFieldChanged(sender: AnyObject) {
        tableview.hidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        tableview.delegate = self
        tableview.dataSource = self
        clinTextField.delegate = self
        
        clinTextField.hidden = true
        
        // Manage tableView visibility via TouchDown in textField
        clinTextField.addTarget(self, action: Selector("textFieldActive"), forControlEvents: UIControlEvents.TouchDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Manage keyboard and tableView visibility
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch:UITouch = touches.first else
        {
            return;
        }
        if touch.view != tableview
        {
            clinTextField.endEditing(true)
            tableview.hidden = true
        }
    }
    
    // Toggle the tableView visibility when click on textField
    func textFieldActive() {
        tableview.hidden = !tableview.hidden
    }
        
        
        override func viewDidLayoutSubviews()
        {
            
            heightConstraint.constant = tableview.contentSize.height
        }

    
    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField) {
        // TODO: Your app can do something when textField finishes editing
        print("The textField ended editing. Do something based on app requirements.")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return values.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        // Set text from the data model
        cell.textLabel?.text = values[indexPath.row]
        cell.textLabel?.font = clinTextField.font
        return cell
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Row selected, so set textField to relevant value, hide tableView
        // endEditing can trigger some other action according to requirements
        clinTextField.text = values[indexPath.row]
        tableView.hidden = true
        clinTextField.endEditing(true)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }

    
    @IBAction func Add(sender: AnyObject)
    {
        
        clin?.clinician = self.clinTextField.text
        clin?.Name = self.clinName.text
        clin?.email = self.clinEmail.text
        clin?.phno = self.clinNum.text
        
        let ref = FIRDatabase.database().reference()
        let key = ref.child("Clinician Details").childByAutoId()
       
        let dictClinician = [ "clinician":  clin?.clinician ,
        "Name" :  clin?.Name,
        "email" : clin?.email,
        "Phone" : clin?.phno]
        
        let childUpdates = ["/Clinician Details/\(key)": dictClinician]
//        ref.updateChildValues(childUpdates)
            self.navigationController?.popViewControllerAnimated(true)
        
    }
}
