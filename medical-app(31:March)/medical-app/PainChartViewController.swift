
//
//  PainChartViewController.swift
//  medical-app
//
//  Created by Administrator on 09/03/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

//import UIKit
////import JBChart
//import Firebase
//import FirebaseAuth
//
//class PainChartViewController: UIViewController, JBBarChartViewDelegate, JBBarChartViewDataSource {
//
//    @IBOutlet weak var barChart: JBBarChartView!
//    @IBOutlet weak var info: UILabel!
//    
//    var databaseRef: FIRDatabaseReference!
//    
//    var chartLegend = ["11-14", "11-15", "11-16", "11-17", "11-18", "11-19", "11-20"]
//    var chartData = [70, 80, 76, 88, 90, 69, 74]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        databaseRef = FIRDatabase.database().reference()
//
//        DataFromFirebase()
//        
////        view.backgroundColor = UIColor.darkGrayColor()
//        
//        // bar chart setup
//        barChart.backgroundColor = UIColor.darkGrayColor()
//        barChart.delegate = self
//        barChart.dataSource = self
//        barChart.minimumValue = 0
//        barChart.maximumValue = 100
//        
//        barChart.reloadData()
//        
//        barChart.setState(.Collapsed, animated: false)
//        
//    }
//    
//    func DataFromFirebase()
//    {
//         var u_id = FIRAuth.auth()?.currentUser!.uid
//         print(u_id)
//        
//          databaseRef = FIRDatabase.database().reference().child("medical_details")
//          databaseRef.queryOrderedByChild("user_id").queryEqualToValue(u_id).observeEventType(.Value, withBlock: { (snapshot) in
//            for item in snapshot.children
//               {
//                
//                let c_date = item.value!!["created_date"] as! String
//                
//                
//                let Key = item.key
//                //reference to the selected key
//                let usersRef = self.databaseRef.childByAppendingPath(Key!!)
//                //reference to the medicine node inside the key
//                let Ref = usersRef.childByAppendingPath("parts_list")
//                
//                Ref.observeEventType(.Value , withBlock: { (snapshot) in
//                    for item in snapshot.children
//                    {
//                        let date = item.value!!["date"] as! String
////                        print(date)
//                        if (c_date == date)
//                        {
//                        let dosage = item.value!!["pain_level"] as! String
//                         print(dosage)
//                        }
//                    }
//                })
//
//               }
//        })
//    }
//
//    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        let footerView = UIView(frame: CGRectMake(0, 0, barChart.frame.width, 16))
//        
//        print("viewDidLoad: \(barChart.frame.width)")
//        
//        let footer1 = UILabel(frame: CGRectMake(0, 0, barChart.frame.width/2 - 8, 16))
//        footer1.textColor = UIColor.whiteColor()
//        footer1.text = "\(chartLegend[0])"
//        
//        let footer2 = UILabel(frame: CGRectMake(barChart.frame.width/2 - 8, 0, barChart.frame.width/2 - 8, 16))
//        footer2.textColor = UIColor.whiteColor()
//        footer2.text = "\(chartLegend[chartLegend.count - 1])"
//        footer2.textAlignment = NSTextAlignment.Right
//        
//        footerView.addSubview(footer1)
//        footerView.addSubview(footer2)
//        
//        let header = UILabel(frame: CGRectMake(0, 0, barChart.frame.width, 50))
//        header.textColor = UIColor.whiteColor()
//        header.font = UIFont.systemFontOfSize(24)
//        header.text = "Weather: San Jose, CA"
//        header.textAlignment = NSTextAlignment.Center
//        
//        barChart.footerView = footerView
//        barChart.headerView = header
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        // our code
//        barChart.reloadData()
//        
//        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("showChart"), userInfo: nil, repeats: false)
//    }
//    
//    override func viewDidDisappear(animated: Bool) {
//        super.viewDidDisappear(animated)
//        hideChart()
//    }
//    
//    func hideChart() {
//        barChart.setState(.Collapsed, animated: true)
//    }
//    
//    func showChart() {
//        barChart.setState(.Expanded, animated: true)
//    }
//    
//    func numberOfBarsInBarChartView(barChartView: JBBarChartView!) -> UInt {
//        return UInt(chartData.count)
//    }
//    
//    func barChartView(barChartView: JBBarChartView!, heightForBarViewAtIndex index: UInt) -> CGFloat {
//        return CGFloat(chartData[Int(index)])
//    }
//    
//    func barChartView(barChartView: JBBarChartView!, colorForBarViewAtIndex index: UInt) -> UIColor! {
//        return (index % 2 == 0) ? UIColor.redColor() : UIColor.whiteColor()
//    }
//    
//    func barChartView(barChartView: JBBarChartView!, didSelectBarAtIndex index: UInt) {
//        let data = chartData[Int(index)]
//        let key = chartLegend[Int(index)]
//        
//        info.text = "Weather on \(key): \(data)"
//    }
//    
//    func didDeselectBarChartView(barChartView: JBBarChartView!) {
//        info.text = ""
//    }
//    
//    
//    
//
//    
//}
