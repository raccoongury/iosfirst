//
//  MyCell.swift
//  1122UseMap
//
//  Created by 503-17 on 23/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
