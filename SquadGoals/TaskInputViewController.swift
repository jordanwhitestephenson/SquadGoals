//
//  TaskInputViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/5/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit
import Firebase

var taskTitle: String = ""
var taskDescription: String = ""
var selectedDate: String = ""
var dateFormatter = DateFormatter()

class TaskInputViewController: UIViewController {

    var todos: ToDos?
    
    @IBOutlet weak var taskTitleField: UITextField!
    @IBOutlet weak var taskDescriptionField: UITextField!

    @IBOutlet weak var taskCalendarField: UIDatePicker!

    @IBAction func addTaskTapped(_ sender: UIButton) {
        taskTitle = (taskTitleField.text!)
        taskDescription = (taskDescriptionField.text!)
        
        
        taskCalendarField.datePickerMode = UIDatePickerMode.date
//        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        selectedDate = dateFormatter.string(from: taskCalendarField.date)
        let taskObject: String = taskDescription + " Date: " + selectedDate
        
        list.append(taskObject)
        
        
        if todos == nil {
            todos = ToDos()
        }
        todos?.taskTitle = taskTitle
        todos?.taskDescription = taskDescription
        todos?.selectedDate = selectedDate
        
        let ref = Database.database().reference()
        let key = ref.child("todoList").childByAutoId().key
        
        let dictionaryTodo = [ "title"    : todos!.taskTitle! ,
                               "description" : todos!.taskDescription!,
                               "date"    : todos!.selectedDate!]
        
        let childUpdates = ["/todoList/\(key)": dictionaryTodo]
        ref.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) -> Void in
            self.navigationController?.popViewController(animated: true)
        })
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }



}
