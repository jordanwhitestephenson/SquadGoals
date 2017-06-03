//
//  TaskListViewController.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/2/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView(<#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

  

    @IBOutlet weak var tableView: UITableView!
}
