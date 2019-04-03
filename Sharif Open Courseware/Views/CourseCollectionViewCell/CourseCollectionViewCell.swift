//
//  CourseCollectionViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/3/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var courseImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseTeacherNameLabel: UILabel!
    @IBOutlet weak var courseDepartmentNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.roundedView.layer.cornerRadius = 8
        self.roundedView.layer.masksToBounds = true
        
        self.layer.applySketchShadow(color: UIColor(named: "slate")!, alpha: 0.14, x: 0, y: 8, blur: 14, spread: 0)
        self.layer.masksToBounds = false
    }
}
