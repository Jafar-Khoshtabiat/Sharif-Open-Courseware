//
//  DepartmentCollectionViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/2/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class DepartmentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var departmentImageView: UIImageView!
    @IBOutlet weak var departmentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.departmentImageView.layer.cornerRadius =
            self.departmentImageView.frame.height / 2
    }
}
