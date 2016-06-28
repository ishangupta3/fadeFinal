//
//  ViewController.swift
//  fade
//
//  Created by Ishan Gupta on 6/21/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var signUpState = false

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passwordSecond: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
   
    
    func  confirm() -> Bool {
        if password.text! == passwordSecond.text! {
            
            return true
            
        } else {
            return false
        }
    }
    
    
  


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.passwordSecond.hidden = true
        signUpState = false
       
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleSignUpButton(sender: UIButton) {
        
        if signUpState == true {
            
            signUpButton.setTitle("Login", forState: UIControlState.Normal)
            
            loginButton.setTitle("Signup", forState: UIControlState.Normal)
            
            self.passwordSecond.hidden = false
            signUpState = false
            
            
            
        } else {
            
            signUpButton.setTitle("Signup", forState: UIControlState.Normal)
            
            loginButton.setTitle("Login", forState: UIControlState.Normal)
            
            self.passwordSecond.hidden = true
            signUpState = true
            
        }
        
    
        
 
        
        
    }
    
    func createAccount() {
        
        if confirm() == true  {
            
            
            
            
            FIRAuth.auth()?.createUserWithEmail(username.text!, password: password.text!, completion: {
                
                
                user, error in
                
                if error !=  nil  {
                    
                    self.login()
                    
                } else {
                    
                    print("User Created")
                    self.login()
                    
                    
                    
                    
                }
                
                
            })
            
        } else {
            print("incorrect")
            // TODO add alert message here so the user can see passwords do not math
            let alert = UIAlertController(title: "Unable to Create Account", message: "Passwords Do not Match", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
    
    func login() {
        FIRAuth.auth()?.signInWithEmail(username.text!, password: password.text!, completion: {
            
            
            user, error in
            
            if error != nil  {
                
                print("Incorrect")
                
                
                
                
            } else {    
                
                print("good boy")
            }
        })
    }
    

    @IBAction func loginB(sender: UIButton) {
        
        if signUpState == true {
            
            login() } else {
            createAccount()
        }
    }
    
    

}

