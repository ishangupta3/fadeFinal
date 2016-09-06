//
//  ViewController.swift
//  fade
//
//  Created by Ishan Gupta on 6/21/16.
//  Copyright © 2016 Ishan Gupta. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import GoogleSignIn





class ViewController: UIViewController, FBSDKLoginButtonDelegate, GIDSignInDelegate, GIDSignInUIDelegate {
    
    
    /*
    
    var signUpState = true

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
    
    
  */
    
    
    
    
    
  
    // Google Sign In Button
    @IBOutlet weak var googleButton: GIDSignInButton!
    
    
    
    
    
   
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //   googleButton.colorScheme.
        
        
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self
        self.loginButton.backgroundColor = UIColor.darkGrayColor()
        self.loginButton.frame = CGRectMake(50, 550, 300, 35)
        self.view!.addSubview(self.loginButton)
        self.loginButton.setTitle("My Login Button", forState: .Normal)
        
        
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        
        
        
     //   self.passwordSecond.hidden = true
        
        
        
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                // User is signed in.
                // Move user to the next screen (home screen)
            } else {
                
                // No user is signed in.
                // show the user the login screen
                
                //ishan
                
                
             

                
            }
        }
        
      
        self.loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        self.loginButton.delegate = self
        self.loginButton.backgroundColor = UIColor.darkGrayColor()
        self.loginButton.frame = CGRectMake(50, 550, 300, 35)
        self.view!.addSubview(self.loginButton)
        self.loginButton.setTitle("My Login Button", forState: .Normal)
        
        // end of view did load
        
    }
        /*
        
         Optional: Place the button in the center of your view.
       loginButton.center = self.view.center
        self.view!.addSubview(loginButton)

       */
        
        
        
        
        
    
    
    
    // Facebok button instance
    let loginButton: FBSDKLoginButton = FBSDKLoginButton()
   
    // function when login button is pressed (FACEBOOK)
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        
        
        if (error != nil) {
            self.loginButton.hidden = false
            
        } else  if(result.isCancelled) {
            
            self.loginButton.hidden = false
            
        } else {
            
            
            let credential = FIRFacebookAuthProvider.credentialWithAccessToken(FBSDKAccessToken.currentAccessToken().tokenString)
            
            FIRAuth.auth()?.signInWithCredential(credential) { (user, error) in
                
                print("User Logged into Firebase")
                
            }
            
        }
        
        
        
    }



    // function when logout button is pressed (FACEBOOK)
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print ("User did Log out")
    }
    
    
    

    // GOOGLE sign in code ______________________________________________
    
      
    
    // Siging in via Google Oauth
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credentialWithIDToken(authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signInWithCredential(credential, completion: {(user,error) in
            
            if (error != nil) {
                print (error?.localizedDescription)
                return
            }
            
            print("user logged in with google")
    })
        
    }
    
    
    // Siging Out via Google Oauth
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user: GIDGoogleUser!, withError error: NSError!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        try! FIRAuth.auth()!.signOut()
        }
    
    
    
    
    // End of class

}







/* 


   | | | | | | |  | | | | |  | | | | | | | | | | |  All CODE BELOW is COMMENTS   | | | | | | | | | | | | | | | |||| | | | | | | 




*/








    /*
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
                
                let alert = UIAlertController(title: "Login Unsuccessfull", message: "Username or Password is Incorrect", preferredStyle: UIAlertControllerStyle.Alert)
                
                alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            
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
    
    */



