//
//  MapTableViewCell.swift
//  SquadGoals
//
//  Created by Jordan Stephenson on 6/6/17.
//  Copyright © 2017 SquadGoals. All rights reserved.
//

import UIKit

class MapTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDate: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
