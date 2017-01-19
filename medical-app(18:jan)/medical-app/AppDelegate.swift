
//  AppDelegate.swift
//  medical-app
//
//  Created by Administrator on 07/10/16.
//  Copyright © 2016 Administrator. All rights reserved.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UINavigationControllerDelegate {

    var window: UIWindow?
    var storyboard: UIStoryboard?
    var navigationController: UINavigationController?
   

   
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        setupAppearance()
        
        IQKeyboardManager.sharedManager().enable = true      
        
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let currentUser = FIRAuth.auth()!.currentUser
        if currentUser != nil
        {
            let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
            let rootViewController:UIViewController = storyboard.instantiateViewControllerWithIdentifier("logmedVC") as! LogMedViewController
            navigationController.viewControllers = [rootViewController]
            self.window?.rootViewController = navigationController
           

        }
        else
        {
            let navigationController:UINavigationController = storyboard.instantiateInitialViewController() as! UINavigationController
            let rootViewController:UIViewController = storyboard.instantiateViewControllerWithIdentifier("firstVC") as! FirstViewcontroller
            navigationController.viewControllers = [rootViewController]
            self.window?.rootViewController = navigationController

        }

        return true
    }
    
    func setupAppearance() {
        
        let navStyle = UINavigationBar.appearance()
        navStyle.barTintColor = UIColor.blueColor()
        navStyle.tintColor = UIColor.darkGrayColor()
        navStyle.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.darkGrayColor()]
        

        
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

