//
//  DepartmentsHeaderTableViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/2/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class DepartmentsHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            guard let _title = self.title else {
                fatalError("this variable can't be nil")
            }
            
            self.titleLabel.text = _title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
