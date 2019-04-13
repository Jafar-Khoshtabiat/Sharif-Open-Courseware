//
//  LoadingView.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/13/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    private var activityView: UIActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        self.activityView = UIActivityIndicatorView(style: .whiteLarge)
        self.activityView!.center = self.center
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startActivityView() {
        self.addSubview(self.activityView!)
        self.activityView?.startAnimating()
    }
    
    func stopActivityView() {
        self.activityView?.removeFromSuperview()
        self.activityView?.stopAnimating()
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        self.stopActivityView()
    }
}
