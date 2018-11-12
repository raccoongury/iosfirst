//
//  TableViewCell.swift
//  1112SubDataDisplay
//
//  Created by 503-17 on 12/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //Cell에선 변수만드는 것밖에안함

    @IBOutlet weak var attractionLabel: UILabel!
    @IBOutlet weak var attractionImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
