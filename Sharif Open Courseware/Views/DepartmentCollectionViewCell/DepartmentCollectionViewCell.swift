//
//  DepartmentCollectionViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/3/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class DepartmentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var departmentImageView: UIImageView!
    @IBOutlet weak var departmentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundedView.layer.cornerRadius = 8
        
        self.layer.applySketchShadow(color: UIColor(named: "slate")!, alpha: 0.22, x: 0, y: 5, blur: 13, spread: 0)
        self.layer.masksToBounds = false
        
        self.departmentImageView.layer.cornerRadius = self.departmentImageView.frame.height / 2
    }
}
