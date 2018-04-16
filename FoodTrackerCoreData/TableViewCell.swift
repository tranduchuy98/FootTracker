//
//  TableViewCell.swift
//  FoodTrackerCoreData
//
//  Created by Huy on 3/30/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var iamgeView: UIImageView!
    @IBOutlet weak var labelTxt: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      iamgeView.layer.cornerRadius = 50
  iamgeView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
