//
//  ViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 5/31/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
     
    }
    
    
    @IBAction func signmeinTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:  {
           (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("HEY WE HAVE AN ERROR:\(String(describing: error))")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                        print("We tried to create a user")
                        
                        if error != nil {
                            print("Theres an error again")
                        } else {
                            print("Created user Successfully")
                            Database.database().reference().child("users").child(user!.uid).child("email").setValue(user!.email!)
                            self.performSegue(withIdentifier:  "signInSegue" , sender: nil)
                        
                        }
                })
                
            } else {
                print("Signed in success")
                self.performSegue(withIdentifier: "signInSegue" , sender: nil)
            }
        })
    
    }
}




