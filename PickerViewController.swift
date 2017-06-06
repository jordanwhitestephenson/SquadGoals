//
//  PickerViewController.swift
//  
//
//  Created by Jordan Stephenson on 6/5/17.
//
//

import UIKit
import Firebase


class PickerViewController: UIViewController {
var todos = ToDos()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationTagLabel: UILabel!
    
    @IBOutlet weak var completeByLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.todos != nil {
            nameLabel.text = self.todos.taskTitle
            descriptionLabel.text = self.todos.taskDescription
            locationTagLabel.text = self.todos.locationTag
           completeByLabel.text = self.todos.selectedDate
          
        }
    }
    
    
    }

