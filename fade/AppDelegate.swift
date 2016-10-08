//
//  AppDelegate.swift
//  fade
//
//  Created by Ishan Gupta on 6/21/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FBSDKLoginKit
import GoogleSignIn
import GoogleMaps


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        
        GMSServices.provideAPIKey("AIzaSyCxVfDa0usqx5Fv4GrsORRFySL03h3RlvQ")
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)

        
       UINavigationBar.appearance().barTintColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        
        
      //  UINavigationBar.appearance().barTintColor = UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
        return true
    }
    
    // google sign in
    
    func application(application: UIApplication,
        openURL url: NSURL, options: [String: AnyObject]) -> Bool {
            return GIDSignIn.sharedInstance().handleURL(url,
                sourceApplication: options[UIApplicationOpenURLOptionsSourceApplicationKey] as? String,
                annotation: options[UIApplicationOpenURLOptionsAnnotationKey])
    }
    
    
    
    
    // facebook signin
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
        // Add any custom logic here.
        return handled
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
        
        FBSDKAppEvents.activateApp()

        
        
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

