//
//  PopUpRequestClinViewController.swift
//  medical-app
//
//  Created by Administrator on 30/01/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import MessageUI

class PopUpRequestClinViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
    var medical_details: [String]=[]
    var sickle_details: [String]=[]
    var user_info: [String]=[]
    
    
    var MedicalDetails: String!
    var SickleDetails: String!
    var UserInfo: String!
    

    @IBOutlet weak var comts_textField: UITextView!
    var databaseRef: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
                 DataFromSickleDetails()
                 DataFromUserDetails()
                 DataFromMedicalDetails()
        
    }
    @IBAction func Submit(sender: AnyObject) {
        
        if let mailVC: MFMailComposeViewController = MFMailComposeViewController() {
            mailVC.mailComposeDelegate = self
            mailVC.setSubject("Patient Information")
            
            
            let mailContent = "Comments: \n \(comts_textField.text!) \n \n MEDICAL DETAILS \n \(MedicalDetails) \n \n SICKLE DETAILS \n \(SickleDetails) \n \n USER INFO \n \(UserInfo)"
            
            mailVC.setMessageBody(mailContent, isHTML: false)
            
            let toRecipient = "izaaptec@gmail.com"
            
            mailVC.setToRecipients([toRecipient])
            
            self.presentViewController(mailVC, animated: true){
                
                self.comts_textField.text = ""
            }
        }
  
        
    }
    
    func DataFromMedicalDetails()
    {
        var u_id = FIRAuth.auth()?.currentUser!.uid
        
        //getting the medical details of uid
        databaseRef = FIRDatabase.database().reference().child("medical_details")
        
        databaseRef.queryOrderedByChild("user_id").queryEqualToValue(u_id).observeEventType(.Value, withBlock: { (snapshot) in
            for item in snapshot.children {
                
                let usr_id = item.value!!["user_id"] as? String

                let comments = item.value!!["comments"] as! String
                let createdOn = item.value!!["created_on"] as! String
                let painLevel = item.value!!["pain_level"] as! String
                let remedies = item.value!!["remedies"] as! String
               
                // key reference to the medicine inside the medical detail
                
                if(u_id == usr_id)
                {
                let Key = item.key
                //reference to the selected key
                    let usersRef = self.databaseRef.childByAppendingPath(Key!!)
                //reference to the medicine node inside the key
                    let Ref = usersRef.childByAppendingPath("medicine")
                
                    Ref.observeEventType(.Value , withBlock: { (snapshot) in
                        for item in snapshot.children {
                            let dosage = item.value!!["dosage"] as! String
                            let frequency = item.value!!["frequency"] as! String
                            let interval = item.value!!["interval"] as! String
                            let tabNum = item.value!!["number_of_tablets"] as! String
                            let tablet = item.value!!["tablet"] as! String
                            

                            var medicalDetails = ("comments:\(comments) \n createdOn:\(createdOn) \n painlevel: \(painLevel) \n remedies: \(remedies) \n tablet: \(tablet) \n dosage:\(dosage) \n frequency:\(frequency) \n interval: \(interval) \n NoOfTablets: \(tabNum)")
                            
                            self.medical_details.append(medicalDetails + "\n")
                            self.MedicalDetails = self.medical_details.joinWithSeparator("\n")
                            
                            print(self.MedicalDetails)
      
                        } // for loop 2
                            })
                  } // end of if cond
            } // for loop 1
        })
        
        
    }


    
    func DataFromSickleDetails()
    {
        var u_id = FIRAuth.auth()?.currentUser!.uid
        
        //getting the medical details of uid
        databaseRef = FIRDatabase.database().reference().child("sickle_details")
        
        databaseRef.queryOrderedByChild("user_id").queryEqualToValue(u_id).observeEventType(.Value, withBlock: { (snapshot) in
            for item in snapshot.children {
            
            
                let aller = item.value!!["allergies"] as! String
                let blood = item.value!!["blood_type"] as! String
                let crisis = item.value!!["date_of_last_crisis"] as! String
                let pertinent = item.value!!["pertinent_medical_information"] as! String
                let port = item.value!!["port_present"] as! String
                let genotype = item.value!!["sickle_cell_genotype"] as! String
                let hydroxyurea = item.value!!["taking_hydroxyurea"] as! String
                let transfusion = item.value!!["transfusion"] as! String
                
               var sickleDetails = ("allergies: \(aller) \n BloodType: \(blood) \n DateOfLastCrisis: \(crisis) \n PertinentInfo: \(pertinent) \n PortPresent: \(port) \n SickleCellGenotype: \(genotype) \n Hydroxyurea: \(hydroxyurea) \n Transfusion: \(transfusion)")

                
                self.sickle_details.append(sickleDetails + "\n")
                self.SickleDetails = self.sickle_details.joinWithSeparator("\n")
                print(self.SickleDetails)
                
            }
            
        })
      

    }
    
        func DataFromUserDetails()
        {
            var mail = FIRAuth.auth()?.currentUser!.email
            
            //getting the medical details of uid
            databaseRef = FIRDatabase.database().reference().child("user_details")
            
            databaseRef.queryOrderedByChild("email").queryEqualToValue(mail).observeEventType(.Value, withBlock: { (snapshot) in
                for item in snapshot.children {
                    
                    let first = item.value!!["firstname"] as? String
                    let last = item.value!!["lastname"] as? String
                    var name = first! + last!
                    let email = item.value!!["email"] as! String
                    let ph = item.value!!["phoneno"] as! String
                    
                    var userinfo = ("Name: \(name) \n Email: \(email) \n ConatctInfo: \(ph)")
                    
                    self.user_info.append(userinfo + "\n")
                    self.UserInfo = self.user_info.joinWithSeparator("\n")
                    print(self.UserInfo)
               
                  }
                })

             }

       }

