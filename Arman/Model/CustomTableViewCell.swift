//
//  CustomTableViewCell.swift
//  Arman
//
//  Created by Mohd Ruknuddin on 28/04/18.
//  Copyright © 2018 Mohd Ruknuddin. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var categorylabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
