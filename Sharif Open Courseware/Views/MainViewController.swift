//
//  MainViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 3/20/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    enum State {
        case myCourses
        case teachers
        case courses
        case departments
    }
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomBarView: UIView!
    
    var state: State? {
        didSet {
            guard let _state = self.state else {
                fatalError("This variable can't be nil")
            }
            
            switch _state {
            case .courses:
                print("TODO")
            case .departments:
                print("TODO")
            case .myCourses:
                print("TODO")
            case .teachers:
                print("TODO")
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topBarView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
        self.bottomBarView.roundCorners(corners: [.topLeft, .topRight], radius: 18)
        
        self.state = .courses
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

