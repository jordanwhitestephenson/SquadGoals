//
//  ToDoItem.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/5/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool = false
    var creationDate: NSDate = NSDate()
    
    init(name:String){
        self.itemName = name as NSString
        
    }

}
