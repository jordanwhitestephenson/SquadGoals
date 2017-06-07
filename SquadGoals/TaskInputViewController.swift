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
var locationTag: String = ""

class TaskInputViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

   var todos: ToDos?

    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var dropDown: UIPickerView!
    @IBOutlet weak var taskTitleField: UITextField!
    @IBOutlet weak var taskDescriptionField: UITextField!
    @IBOutlet weak var taskCalendarField: UIDatePicker!
    
    var list = ["atm", "bakery", "bicycle_store", "book_store", "car_repair", "car_wash", "florist", "laundry", "liquor_store", "pet_store", "post_office",  "pharmacy", "shoe_store", "veterinary_care", "convenience_store", "grocery_or_supermarket"]
    let picker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        textBox.inputView = picker
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return list.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       textBox.text = list[row]
        self.view.endEditing(false)
    }
    
    
    
    
    @IBAction func addTaskTapped(_ sender: UIButton) {
        taskTitle = (taskTitleField.text!)
        taskDescription = (taskDescriptionField.text!)
        locationTag = (textBox.text!)
        
        
        taskCalendarField.datePickerMode = UIDatePickerMode.date

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
        todos?.locationTag = locationTag
        
        let ref = Database.database().reference()
        let key = ref.child("todoList").childByAutoId().key
        
        let dictionaryTodo = [ "title"    : todos!.taskTitle! ,
                               "description" : todos!.taskDescription!,
                               "date"    : todos!.selectedDate!,
                               "locationTag": todos!.locationTag!]
        
        let childUpdates = ["/todoList/\(key)": dictionaryTodo]
        ref.updateChildValues(childUpdates, withCompletionBlock: { (error, ref) -> Void in
            self.navigationController
        })
        
    }
    
 

 
    

}
