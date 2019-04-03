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
    @IBOutlet weak var bottomBarContainerView: UIView!
    @IBOutlet weak var coursesImageView: UIImageView!
    @IBOutlet weak var coursesLabel: UILabel!
    @IBOutlet weak var teachersImageView: UIImageView!
    @IBOutlet weak var teachersLabel: UILabel!
    @IBOutlet weak var myCoursesImageView: UIImageView!
    @IBOutlet weak var myCoursesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var departmentsCollectionView: UICollectionView!
    
    var homeViewModel: HomeViewModel?
    
    var state: State? {
        didSet {
            guard let newState = self.state else {
                fatalError("This variable can't be nil")
            }
            
            if newState != oldValue {
                if let _oldValue = oldValue {
                    switch _oldValue {
                    case .courses:
                        self.coursesImageView.image = UIImage(named: "book-open_grey")
                        self.coursesLabel.textColor = UIColor(named: "blueGreyTwo")
                    case .teachers:
                        self.teachersImageView.image = UIImage(named: "graduation-hat_grey")
                        self.teachersLabel.textColor = UIColor(named: "blueGreyTwo")
                    case .myCourses:
                        self.myCoursesImageView.image = UIImage(named: "heart_grey")
                        self.myCoursesLabel.textColor = UIColor(named: "blueGreyTwo")
                    }
                } else {
                    self.coursesImageView.image = UIImage(named: "book-open_grey")
                    self.coursesLabel.textColor = UIColor(named: "blueGreyTwo")
                    self.teachersImageView.image = UIImage(named: "graduation-hat_grey")
                    self.teachersLabel.textColor = UIColor(named: "blueGreyTwo")
                    self.myCoursesImageView.image = UIImage(named: "heart_grey")
                    self.myCoursesLabel.textColor = UIColor(named: "blueGreyTwo")
                }
                
                switch newState {
                case .courses:
                    self.coursesImageView.image = UIImage(named: "book-open_blue")
                    self.coursesLabel.textColor = UIColor(named: "brightLightBlue")
                case .teachers:
                    self.teachersImageView.image = UIImage(named: "graduation-hat_blue")
                    self.teachersLabel.textColor = UIColor(named: "brightLightBlue")
                case .myCourses:
                    self.myCoursesImageView.image = UIImage(named: "heart_blue")
                    self.myCoursesLabel.textColor = UIColor(named: "brightLightBlue")
                }
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topBarView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 12)
        
        self.bottomBarContainerView.roundCorners(corners: [.topLeft, .topRight], radius: 18)
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
        
        self.tableView.register(UINib(nibName: "ItemsHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsHeaderTableViewCell")
        self.tableView.register(UINib(nibName: "DepartmentsCollectionViewTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentsCollectionViewTableViewCell")
        self.tableView.register(UINib(nibName: "CoursesCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesCollectionTableViewCell")
        
        self.homeViewModel = HomeViewModel(vc: self)
    }
    
    @IBAction func coursesButtonTouchUpInside(_ sender: UIButton) {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        viewModel.coursesButtonTouchUpInsideEvent()
    }
    
    @IBAction func teachersButtonTouchUpInside(_ sender: UIButton) {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        viewModel.teachersButtonTouchUpInsideEvent()
    }
    
    @IBAction func myCoursesButtonTouchUpInside(_ sender: UIButton) {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        viewModel.myCoursesButtonTouchUpInsideEvent()
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
            return 1000
//            return UITableView.automaticDimension
        default:
            fatalError("should not reach here")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsHeaderTableViewCell", for: indexPath) as! ItemsHeaderTableViewCell
            cell.title = Title.departments.rawValue
            cell.delegate = self
            return cell
        case (0, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentsCollectionViewTableViewCell", for: indexPath) as! DepartmentsCollectionViewTableViewCell
            cell.collectionView.tag = 2
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsHeaderTableViewCell", for: indexPath) as! ItemsHeaderTableViewCell
            cell.title = Title.courses.rawValue
            cell.delegate = self
            return cell
        case (1, 1):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesCollectionTableViewCell", for: indexPath) as! CoursesCollectionTableViewCell
            cell.collectionView.tag = 3
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
            return cell
        } else {
            fatalError("should not reach here")
        }
    }
}

extension HomeViewController: ItemsHeaderTableViewCellDelegate {
    func itemsHeaderTableViewCellWantsToSeeAllItemsWith(title: String) {
        switch title {
        case Title.departments.rawValue:
            
        case Title.courses.rawValue:
            fatalError("TODO")
        default:
            fatalError("should not reach here")
        }
    }
}

