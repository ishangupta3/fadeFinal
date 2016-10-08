//
//  OurViewController.swift
//  fade
//
//  Created by Ishan Gupta on 8/2/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class OurViewController: UIViewController {
    
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
   // outlet for the bar button item in regards to the shop list view 
    @IBOutlet weak var shopList: UIBarButtonItem!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FADE"
        
        
        
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
         //   menuButton.action = "revealToggle"
           
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        

        // Do any additional setup after loading the view.
    }
// CHECK OUT PRBLEM ****************
    
//    
//    @IBAction func shopDetail(sender: AnyObject) {
//        
//    
//        dispatch_async(dispatch_get_main_queue()){
//            
//            self.performSegueWithIdentifier("Klikur", sender: self)
//            
//        }
//    }
    
    
   // ***************************************

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
