//
//  AddTaskViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/2/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps
import CoreLocation
import GooglePlaces




class AddTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate, UITextFieldDelegate {
    

  
    @IBOutlet weak var TaskMapView: GMSMapView!

    @IBOutlet weak var myToDoListTableView: UITableView!
  
    var todoList = [ToDos]()
    var myLocation: CLLocationCoordinate2D!
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    
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
//        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        myLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        TaskMapView.camera = GMSCameraPosition(target: myLocation, zoom: 15, bearing: 0, viewingAngle: 0)
        locationManager.stopUpdatingLocation()
        let marker = GMSMarker()
        marker.position = TaskMapView.camera.target
        marker.snippet = "Current Location"
        marker.map = TaskMapView
        
    }

    
}
