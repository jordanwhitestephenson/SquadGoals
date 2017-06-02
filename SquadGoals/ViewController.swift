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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signmeinTapped(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion:  {
           (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("HEY WE HAVE AN ERROR:\(error)")
            } else {
                print("Signed in success")
            }
        })
    
    }
}




