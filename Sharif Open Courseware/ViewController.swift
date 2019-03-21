//
//  ViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 3/20/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomBarView: UIView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topBarView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
        self.bottomBarView.roundCorners(corners: [.topLeft, .topRight], radius: 18)
    }
    
    @IBAction func coursesDepartmentsSwitchButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func myCoursesButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func teachersButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func coursesButtonPressed(_ sender: UIButton) {
        
    }
}

