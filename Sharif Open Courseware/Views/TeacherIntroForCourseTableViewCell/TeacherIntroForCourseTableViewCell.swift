//
//  TeacherIntroForCourseTableViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/4/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class TeacherIntroForCourseTableViewCell: UITableViewCell {

    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var teacherIntroLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.teacherImageView.layer.cornerRadius = self.teacherImageView.frame.height / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
