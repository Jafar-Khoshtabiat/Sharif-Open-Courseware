//
//  CourseVideoTableViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/7/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class CourseVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var roundedView: UIView!
    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var sessionNumberLabel: UILabel!
    @IBOutlet weak var sessionNameLabel: UILabel!
    @IBOutlet weak var seenView: UIView!
    @IBOutlet weak var seenImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.applySketchShadow(color: UIColor(named: "slate")!, alpha: 0.22, x: 0.0, y: 5.0, blur: 13.0, spread: 0.0)
        
        self.roundedView.layer.cornerRadius = 8
        
        self.seenView.layer.cornerRadius = self.seenView.frame.height / 2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
