//
//  TaskListViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/2/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit
import Firebase

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var users: [User] = []
    
    override func viewDidLoad() {
super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        Database.database().reference().child("users").observe(DataEventType.childAdded, with: {(snapshot) in
        print(snapshot)
          
        let user = User()
            user.email = (snapshot.value as! NSDictionary)["email"] as! String
            user.uid = snapshot.key
            
            self.users.append(user)
            self.tableView.reloadData()
            
        })

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let user = users[indexPath.row]
        
        cell.textLabel?.text = user.email
        return cell
    }

  


}
