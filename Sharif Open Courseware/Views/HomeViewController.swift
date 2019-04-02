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
    
    enum Title: String {
        case departments = "دانشکده‌ها"
        case courses = "دوره‌های آموزشی جدید"
    }
    
    let searchTextFieldPlaceHolder = "جست‌جوی نام درس یا استاد"
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var bottomBarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var homeViewModel: HomeViewModel?
    
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
        
        self.tableView.register(UINib(nibName: "DepartmentsHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentsHeaderTableViewCell")
        self.tableView.register(UINib(nibName: "DepartmentsCollectionViewTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentsCollectionViewTableViewCell")
        
        self.homeViewModel = HomeViewModel()
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
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        return viewModel.getNumberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            return 40
        case (0, 1):
            return 311
        case (1, 0):
            return 40
        case (1, 1):
            // MARK: TODO
            return 0
        default:
            fatalError("should not reach here")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentsHeaderTableViewCell", for: indexPath) as! DepartmentsHeaderTableViewCell
            cell.title = Title.departments.rawValue
            return cell
        case (0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentsCollectionViewTableViewCell", for: indexPath) as! DepartmentsCollectionViewTableViewCell
            cell.collectionView.tag = 2
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentsHeaderTableViewCell", for: indexPath) as! DepartmentsHeaderTableViewCell
            cell.title = Title.courses.rawValue
            return cell
        case (1, 1):
            // MARK: TODO
            return UITableViewCell()
        default:
            fatalError("should not reach here")
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 2 {
            // MARK: TODO
            return 10
        } else if collectionView.tag == 3 {
            // MARK: TODO
            return 10
        } else {
            fatalError("should not reach here")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepartmentCollectionViewCell", for: indexPath) as! DepartmentCollectionViewCell
            return cell
        } else if collectionView.tag == 3 {
            // MARK: TODO
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepartmentCollectionViewCell", for: indexPath) as! DepartmentCollectionViewCell
            return cell
        } else {
            fatalError("should not reach here")
        }
    }
}

