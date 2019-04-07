//
//  CourseViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/4/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {

    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var topBarTitleLabel: UILabel!
    @IBOutlet weak var topImageContainerView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var departmentNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var courseIntroView: UIView!
    @IBOutlet weak var courseVideosView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var selectionViewTopToTopImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var selectionViewTopToTopBarViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topImageViewTopToSafeAreaTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageViewBottomToSafeAreaTopConstraint: NSLayoutConstraint!
    
    var courseViewModel: CourseViewModel?
    
    var showTopImage = true {
        didSet {
            if self.showTopImage {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                    self.selectionViewTopToTopImageViewConstraint.priority = .defaultHigh
                    self.selectionViewTopToTopBarViewConstraint.priority = .defaultLow
                    self.topImageViewTopToSafeAreaTopConstraint.priority = .defaultHigh
                    self.topImageViewBottomToSafeAreaTopConstraint.priority = .defaultLow
                    self.view.layoutIfNeeded()
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.2, delay: 0.0, options: [.curveEaseOut], animations: {
                    self.selectionViewTopToTopBarViewConstraint.priority = .defaultHigh
                    self.selectionViewTopToTopImageViewConstraint.priority = .defaultLow
                    self.topImageViewBottomToSafeAreaTopConstraint.priority = .defaultHigh
                    self.topImageViewTopToSafeAreaTopConstraint.priority = .defaultLow
                    self.view.layoutIfNeeded()
                }, completion: nil)
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = self.courseViewModel else {
            fatalError("cannot access CourseViewModel object")
        }
        
        viewModel.viewDidLoad()
        
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "DepartmentIntroductionTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentIntroductionTableViewCell")
        self.tableView.register(UINib(nibName: "TeacherIntroForCourseTableViewCell", bundle: nil), forCellReuseIdentifier: "TeacherIntroForCourseTableViewCell")
        self.tableView.register(UINib(nibName: "DepartmentCoursesCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentCoursesCollectionTableViewCell")
        
        self.selectionViewTopToTopImageViewConstraint.priority = .defaultHigh
        self.selectionViewTopToTopBarViewConstraint.priority = .defaultLow
        self.topImageViewTopToSafeAreaTopConstraint.priority = .defaultHigh
        self.topImageViewBottomToSafeAreaTopConstraint.priority = .defaultLow
    }
    
    func displayCourseIntro(value: Bool) {
        if value {
            self.courseIntroView.isHidden = false
            self.courseVideosView.isHidden = true
        } else {
            self.courseIntroView.isHidden = true
            self.courseVideosView.isHidden = false
        }
    }
    
    func switchTableView() {
        self.tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func closeButtonTouchUpInside(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deleteButtonTouchUpInside(_ sender: UIButton) {
    }
    
    @IBAction func courseIntroButtonTouchUpInside(_ sender: UIButton) {
        guard let viewModel = self.courseViewModel else {
            fatalError("cannot access CourseViewModel object")
        }
        
        viewModel.courseIntroButtonTouchUpInsideEvent()
    }
    
    @IBAction func courseVideosButtonTouchUpInside(_ sender: UIButton) {
        guard let viewModel = self.courseViewModel else {
            fatalError("cannot access CourseViewModel object")
        }
        
        viewModel.courseVideosButtonTouchUpInsideEvent()
    }
}

extension CourseViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel = self.courseViewModel else {
            fatalError("should not reach here")
        }
        
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = self.courseViewModel else {
            fatalError("should not reach here")
        }
        
        return viewModel.getNumberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let viewModel = self.courseViewModel else {
            fatalError("should not reach here")
        }
        
        switch viewModel.getState() {
        case .courseIntro:
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                return UITableView.automaticDimension
            case (1, 0):
                return UITableView.automaticDimension
            case (2, 0):
                return 1000
            default:
                fatalError("should not reach here")
            }
        case .courseVideos:
            // MARK: TODO
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = self.courseViewModel else {
            fatalError("should not reach here")
        }
        
        switch viewModel.getState() {
        case .courseIntro:
            switch (indexPath.section, indexPath.row) {
            case (0, 0):
                let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentIntroductionTableViewCell", for: indexPath) as! DepartmentIntroductionTableViewCell
                return cell
            case (1, 0):
                let cell = tableView.dequeueReusableCell(withIdentifier: "TeacherIntroForCourseTableViewCell", for: indexPath) as! TeacherIntroForCourseTableViewCell
                return cell
            case (2, 0):
                let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentCoursesCollectionTableViewCell", for: indexPath) as! DepartmentCoursesCollectionTableViewCell
//                cell.collectionView.tag = Tag.collectionViewTag.rawValue
                cell.collectionView.delegate = self
                cell.collectionView.dataSource = self
                return cell
            default:
                fatalError("should not reach here")
            }
        case .courseVideos:
            // MARK: TODO
            return UITableViewCell()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.tag == Tag.tableViewTag.rawValue {
            if scrollView.contentOffset.y > 250 && self.showTopImage {
                print("tableViewScroll -> \(scrollView.contentOffset)")
                self.showTopImage = false
            } else if scrollView.contentOffset.y <= 250 && !self.showTopImage {
                print("tableViewScroll -> \(scrollView.contentOffset)")
                self.showTopImage = true
            }
//        }
    }
}

extension CourseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
        return cell
    }
}
