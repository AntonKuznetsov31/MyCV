//
//  HobbyTableViewCell.swift
//  MyCV
//
//  Created by Anton Kuznetsov on 4/21/19.
//  Copyright © 2019 AntonKuznetsov. All rights reserved.
//

import UIKit

class HobbyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var hobbyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
