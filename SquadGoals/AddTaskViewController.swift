//
//  AddTaskViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/2/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit
import Firebase

var list = ["Buy Milk", "Run 5 Miles", "Get Peter", "Plant My New Plants"]


class AddTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    

    @IBOutlet weak var myToDoListTableView: UITableView!
  
    var todoList = [ToDos]()

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadData()
  
    }
    
    func loadData() {
        self.todoList.removeAll()
        let ref = Database.database().reference()
        ref.child("todoList").observeSingleEvent(of: .value, with: { (snapshot) in
            if let todoDict = snapshot.value as? [String:AnyObject] {
                for (_,todoElement) in todoDict {
                    print(todoElement);
                    let todos = ToDos()
                    todos.taskTitle = todoElement["title"] as? String
                    todos.taskDescription = todoElement["description"] as? String
                    todos.selectedDate = todoElement["date"] as? String
                    todos.locationTag = todoElement["locationTag"] as? String
                    self.todoList.append(todos)
                }
            }
            self.myToDoListTableView.reloadData()
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ToDoCell")
        cell.textLabel?.text = todoList[indexPath.row].taskTitle
        return (cell)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
                if editingStyle == UITableViewCellEditingStyle.delete {
                    todoList.remove(at: indexPath.row)
                    myToDoListTableView.reloadData()
                }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
            myToDoListTableView.reloadData()
            }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todoVC = self.storyboard!.instantiateViewController(withIdentifier: "ToDoVC") as! PickerViewController
       
        todoVC.todos = todoList[indexPath.row]
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    

    
    
    
    
    
    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return (list.count)
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
//        cell.textLabel?.text = list[indexPath.row]
//   
//        return(cell)
//    }
//    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCellEditingStyle.delete {
//            list.remove(at: indexPath.row)
//            myToDoListTableView.reloadData()
//        }
//    }
//    override func viewDidAppear(_ animated: Bool) {
//    myToDoListTableView.reloadData()
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }
//


}
