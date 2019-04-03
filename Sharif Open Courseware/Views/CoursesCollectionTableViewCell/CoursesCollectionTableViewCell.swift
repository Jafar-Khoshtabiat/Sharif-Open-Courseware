//
//  CoursesCollectionTableViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/3/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class CoursesCollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: "CourseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CourseCollectionViewCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
