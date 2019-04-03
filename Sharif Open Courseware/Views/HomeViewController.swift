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
        case newCourses = "دوره‌های آموزشی جدید"
        case courses = "دوره‌های آموزشی"
    }
    
    let searchTextFieldPlaceHolder = "جست‌جوی نام درس یا استاد"
    
    enum Tag: Int {
        case mainTableViewTag = 4
        case departmentsCollectionViewTag = 2
        case coursesCollectionViewTag = 3
        case allDepartmentsCollectionViewTag = 20
        case allCoursesCollectionTableViewTag = 30
    }
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var ocwTitleLabel: UILabel!
    @IBOutlet weak var coursesTitleLabel: UILabel!
    @IBOutlet weak var departmentsTitleLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!
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
    @IBOutlet weak var dummyContainerView: UIView!
    @IBOutlet weak var coursesCollectionTableView: UITableView!
    
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
                    self.closeButton.isHidden = true
                    self.coursesTitleLabel.isHidden = true
                    self.departmentsTitleLabel.isHidden = true
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
        self.tableView.tag = Tag.mainTableViewTag.rawValue
        
        self.tableView.register(UINib(nibName: "ItemsHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemsHeaderTableViewCell")
        self.tableView.register(UINib(nibName: "DepartmentsCollectionViewTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentsCollectionViewTableViewCell")
        self.tableView.register(UINib(nibName: "CoursesCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesCollectionTableViewCell")
        
        self.departmentsCollectionView.tag = Tag.allDepartmentsCollectionViewTag.rawValue
        self.departmentsCollectionView.delegate = self
        self.departmentsCollectionView.dataSource = self

        self.departmentsCollectionView.register(UINib(nibName: "DepartmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DepartmentCollectionViewCell")
        
        self.coursesCollectionTableView.tag = Tag.allCoursesCollectionTableViewTag.rawValue
        self.coursesCollectionTableView.delegate = self
        self.coursesCollectionTableView.dataSource = self

        self.coursesCollectionTableView.register(UINib(nibName: "CoursesCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CoursesCollectionTableViewCell")
        
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
    
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        if !self.departmentsTitleLabel.isHidden {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.departmentsCollectionView.frame = CGRect(x: 0, y: self.view.frame.maxY,
                                                              width: self.departmentsCollectionView.frame.width,
                                                              height: self.departmentsCollectionView.frame.height)
                self.closeButton.isHidden = true
//            self.bottomBarView.isHidden = false
                self.searchView.isHidden = false
                self.ocwTitleLabel.isHidden = false
                self.departmentsTitleLabel.isHidden = true
            }, completion: nil)
        } else if !self.coursesTitleLabel.isHidden {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.coursesCollectionTableView.frame = CGRect(x: 0, y: self.view.frame.maxY,
                                                              width: self.coursesCollectionTableView.frame.width,
                                                              height: self.coursesCollectionTableView.frame.height)
                self.closeButton.isHidden = true
//            self.bottomBarView.isHidden = false
                self.searchView.isHidden = false
                self.ocwTitleLabel.isHidden = false
                self.coursesTitleLabel.isHidden = true
            }, completion: nil)
        } else {
            fatalError("should not reach here")
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        switch tableView.tag {
        case Tag.mainTableViewTag.rawValue:
            return viewModel.getNumberOfSections()
        case Tag.allCoursesCollectionTableViewTag.rawValue:
            return 1
        default:
            fatalError("should not reach here")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.homeViewModel else {
            fatalError("cannot access HomeViewModel object")
        }
        
        switch tableView.tag {
        case Tag.mainTableViewTag.rawValue:
            return viewModel.getNumberOfRowsInSection(section: section)
        case Tag.allCoursesCollectionTableViewTag.rawValue:
            return 1
        default:
            fatalError("should not reach here")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView.tag {
        case Tag.mainTableViewTag.rawValue:
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
        case Tag.allCoursesCollectionTableViewTag.rawValue:
            // MARK: TODO
            return 1000
        default:
            fatalError("should not reach here")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case Tag.mainTableViewTag.rawValue:
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsHeaderTableViewCell", for: indexPath) as! ItemsHeaderTableViewCell
                cell.title = Title.departments.rawValue
                cell.delegate = self
                return cell
            case (0, 1):
                let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentsCollectionViewTableViewCell", for: indexPath) as! DepartmentsCollectionViewTableViewCell
                cell.collectionView.tag = Tag.departmentsCollectionViewTag.rawValue
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                return cell
            case (1, 0):
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsHeaderTableViewCell", for: indexPath) as! ItemsHeaderTableViewCell
                cell.title = Title.newCourses.rawValue
                cell.delegate = self
                return cell
            case (1, 1):
                let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesCollectionTableViewCell", for: indexPath) as! CoursesCollectionTableViewCell
                cell.collectionView.tag = Tag.coursesCollectionViewTag.rawValue
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                return cell
            default:
                fatalError("should not reach here")
            }
        case Tag.allCoursesCollectionTableViewTag.rawValue:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoursesCollectionTableViewCell", for: indexPath) as! CoursesCollectionTableViewCell
            cell.collectionView.tag = Tag.coursesCollectionViewTag.rawValue
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
        switch collectionView.tag {
        case Tag.departmentsCollectionViewTag.rawValue:
            // MARK: TODO
            return 10
        case Tag.coursesCollectionViewTag.rawValue:
            // MARK: TODO
            return 10
        case Tag.allDepartmentsCollectionViewTag.rawValue:
            // MARK: TODO
            return 10
        case Tag.allCoursesCollectionTableViewTag.rawValue:
            // MARK: TODO
            return 10
        default:
            fatalError("should not reach here")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case Tag.departmentsCollectionViewTag.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepartmentCollectionViewCell", for: indexPath) as! DepartmentCollectionViewCell
            return cell
        case Tag.coursesCollectionViewTag.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
            return cell
        case Tag.allDepartmentsCollectionViewTag.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DepartmentCollectionViewCell", for: indexPath) as! DepartmentCollectionViewCell
            return cell
        case Tag.allCoursesCollectionTableViewTag.rawValue:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
            return cell
        default:
            fatalError("should not reach here")
        }
    }
}

extension HomeViewController: ItemsHeaderTableViewCellDelegate {
    func itemsHeaderTableViewCellWantsToSeeAllItemsWith(title: String) {
//        self.tableView.isHidden = true
        
        switch title {
        case Title.departments.rawValue:
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.departmentsCollectionView.frame = CGRect(x: 0, y: self.topBarView.frame.maxY + 16,
                                                              width: self.departmentsCollectionView.frame.width,
                                                              height: self.departmentsCollectionView.frame.height)
                
                self.closeButton.isHidden = false
//                self.bottomBarView.isHidden = true
                self.searchView.isHidden = true
                self.ocwTitleLabel.isHidden = true
                self.departmentsTitleLabel.isHidden = false
                self.coursesTitleLabel.isHidden = true
            }, completion: nil)
        case Title.newCourses.rawValue:
            UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                self.coursesCollectionTableView.frame = CGRect(x: 0, y: self.dummyContainerView.frame.minY,
                                                              width: self.coursesCollectionTableView.frame.width,
                                                              height: self.coursesCollectionTableView.frame.height)
                
                self.closeButton.isHidden = false
//                self.bottomBarView.isHidden = true
                self.searchView.isHidden = true
                self.ocwTitleLabel.isHidden = true
                self.departmentsTitleLabel.isHidden = true
                self.coursesTitleLabel.isHidden = false
            }, completion: nil)
        default:
            fatalError("should not reach here")
        }
    }
}

