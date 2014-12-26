//
//  ViewController.swift
//  LoginDemo
//
//  Created by Marco F.A. Corzani on 09.12.14.
//  Copyright (c) 2014 Alphaweb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
 }

    
    

    
    
    // Wenn nur Email und Passwort und kEIN Username verwendet werden soll, Email dem Username und der Email bei Parse zuweisen!
    
    

    @IBAction func loginVerifyButton(sender: AnyObject) {
    
        var initialEmail = emailTextField.text
        var email = initialEmail.lowercaseString
        var finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        
        var usrEntered = usernameTextField.text
        var pwdEntered = passwordTextField.text
        var emlEntered = finalEmail
        
        
  
    
    
    
        func userSignUp() {
            var user = PFUser()
            user.username = usrEntered
            user.password = pwdEntered
            user.email = emlEntered
            
            user.signUpInBackgroundWithBlock {(succeeded: Bool!, error: NSError!) -> Void in
                if error == nil {
                // Hooray! Let them use the app now.
                    self.messageLabel.textColor = UIColor.greenColor()
                    self.messageLabel.text = "Check your email to verify"
                }
                
                else if (error.code == 202) {
                    self.messageLabel.textColor = UIColor.redColor()
                    self.messageLabel.text = "Username already taken"
                    
                }
                else if (error.code == 125) {
                    self.messageLabel.textColor = UIColor.redColor()
                    self.messageLabel.text = "Invalid email address"
                }
                else if (error.code == 203) {
                        self.messageLabel.textColor = UIColor.redColor()
                        self.messageLabel.text = "Email address already taken"
                }
                
                else {
                    // Show the errorString somewhere and let the user try again.
                    
                
                
                }
            }
        }

        if usrEntered != "" && pwdEntered != "" && emlEntered != "" {
        // Wenn nicht leer, dann......
            
        userSignUp() // Aufruf der Funktion von oben
        
        }
        
       
        else {
            self.messageLabel.text = "All Fields are required!"
            self.messageLabel.textColor = UIColor.redColor()
        }
        
    
    
    }

    






}