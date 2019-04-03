//
//  ItemsHeaderTableViewCell.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/2/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

protocol ItemsHeaderTableViewCellDelegate {
    func itemsHeaderTableViewCellWantsToSeeAllItemsWith(title: String)
}

class ItemsHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: ItemsHeaderTableViewCellDelegate?
    
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
    
    @IBAction func seeAllButtonTouchUpInside(_ sender: UIButton) {
        guard let _title = self.title else {
            fatalError("this variable can't be nil")
        }
        
        self.delegate?.itemsHeaderTableViewCellWantsToSeeAllItemsWith(title: _title)
    }
}
