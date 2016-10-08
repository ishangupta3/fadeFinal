//
//  Promo.swift
//  fade
//
//  Created by Ishan Gupta on 9/8/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit

class Promo: UIViewController {

    @IBOutlet weak var promoButton: UIBarButtonItem!
    
    @IBOutlet weak var promoPhrase: UITextField!
    
    
    @IBAction func submit(sender: AnyObject) {
        
        if promoPhrase.text != "" {
            let alert = UIAlertController(title: "Unsuccessful ", message: "Only Valid for new users", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Functionality for the Bar Button Item
            if self.revealViewController() != nil {
            promoButton.target = self.revealViewController()
            promoButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }


        // Do any additional setup after loading the view.
    }

    
   

   

}
