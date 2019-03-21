//
//  UIView+Extension.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 3/21/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
