//
//  HobbyDetailTableViewCell.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/23/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class HobbyDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hobbyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
