//
//  HomeViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 3/20/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum State {
        case myCourses
        case teachers
        case courses
        case departments
    }
    
    let searchTextFieldPlaceHolder = "جست‌جوی نام درس یا استاد"
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var bottomBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
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
        self.bottomBarView.layer.applySketchShadow(color: UIColor(named: "blueGreyTwo")!, alpha: 0.72, x: 0, y: 0, blur: 15, spread: 0)
        
        self.searchView.layer.cornerRadius = self.searchView.frame.height / 3
        self.searchView.layer.applySketchShadow(color: UIColor(named: "slate")!, alpha: 0.22, x: 0, y: 6, blur: 14, spread: 0)
        
        self.searchTextField.delegate = self
        self.searchTextField.attributedPlaceholder =
            NSAttributedString(string: self.searchTextFieldPlaceHolder,
                               attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "blueGreyThree")!.withAlphaComponent(0.34)])
        
        self.state = .courses
        
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
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

extension HomeViewController: UITextFieldDelegate {
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

