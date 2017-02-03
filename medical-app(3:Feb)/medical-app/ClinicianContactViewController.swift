//
//  ViewController.swift
//  UITextFieldDropDownList
//
//  Created by Lawrence F MacFadyen on 2016-08-06.
//  Copyright © 2016 LawrenceM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ClinicianContactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {

//     The sample values
    var values = ["Physician", "Pharmacist", "Nurse", "Physician Assistant","Clinical Researcher"]

    var databaseRef: FIRDatabaseReference! {
        return FIRDatabase.database().reference()
    }
    let cellReuseIdentifier = "cell"
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    // Using simple subclass to prevent the copy/paste menu
    // This is optional, and a given app may want a standard UITextField
    @IBOutlet weak var clinTextField: dropTextField!
    @IBOutlet var clinName: UITextField!
    @IBOutlet var clinEmail: UITextField!
    @IBOutlet var clinNum: UITextField!
    
    var clin:Clinician?
    @IBOutlet weak var tableView: UITableView!
    
    // If user changes text, hide the tableView
    @IBAction func textFieldChanged(sender: AnyObject) {
        tableView.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)

        tableView.delegate = self
        tableView.dataSource = self
        clinTextField.delegate = self
        
        tableView.hidden = true
        
        // Manage tableView visibility via TouchDown in textField
        clinTextField.addTarget(self, action: Selector("textFieldActive"), forControlEvents: UIControlEvents.TouchDown)
    }
    
    override func viewDidLayoutSubviews()
    {
        // Assumption is we're supporting a small maximum number of entries
        // so will set height constraint to content size
        // Alternatively can set to another size, such as using row heights and setting frame
        heightConstraint.constant = tableView.contentSize.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Manage keyboard and tableView visibility
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        guard let touch:UITouch = touches.first else
        {
            return;
        }
        if touch.view != tableView
        {
            clinTextField.endEditing(true)
            tableView.hidden = true
        }
        
    }
    
    // Toggle the tableView visibility when click on textField
    func textFieldActive() {
        tableView.hidden = !tableView.hidden
    }
    
    // MARK: UITextFieldDelegate
//    func textFieldDidEndEditing(textField: UITextField) {
//        // TODO: Your app can do something when textField finishes editing
//        print("The textField ended editing. Do something based on app requirements.")
//    }
    
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
        var clinician = self.clinTextField.text
        var Name = self.clinName.text
        var email = self.clinEmail.text
        var phno = self.clinNum.text
        var u_id = FIRAuth.auth()?.currentUser?.uid

        let ref = databaseRef.child("clinician_details").childByAutoId()

        let updatenote = Clinician(clinician_type:clinTextField.text!, name:clinName.text!,email:clinEmail.text!,phone:clinNum.text!,user_id:u_id!)
        print(updatenote)
        ref.setValue(updatenote.toAnyObject())
        
        self.navigationController?.popViewControllerAnimated(true)
        }

}

