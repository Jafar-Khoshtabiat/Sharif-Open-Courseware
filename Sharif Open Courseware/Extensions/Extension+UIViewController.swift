//
//  Extension+UIViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/13/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

extension UIViewController {
    func showLoadingView() -> LoadingView {
        let loadingView = LoadingView(frame: self.view.frame)
        loadingView.startActivityView()
        self.view.addSubview(loadingView)
        return loadingView
    }
}
