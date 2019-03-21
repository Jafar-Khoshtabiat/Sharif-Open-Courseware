//
//  ViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 3/20/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(UIApplication.shared.statusBarFrame.height)
    }
}

