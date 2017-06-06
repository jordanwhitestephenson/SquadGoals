//
//  ToDos.swift
//  
//
//  Created by Jordan Stephenson on 6/5/17.
//
//

import UIKit
import Firebase

class ToDos: NSObject {
    
    var taskTitle:String?
    var taskDescription: String?
    var selectedDate: String?
    // id which is set from firebase to uniquely identify it
    var uniqueId:String?

}
