//
//  DepartmentViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/4/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class DepartmentViewController: UIViewController {
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var topBarTitleLabel: UILabel!
    @IBOutlet weak var topImageContainerView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var departmentTitleLabel: UILabel!
    @IBOutlet weak var coursesCountLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    var departmentViewModel: DepartmentViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "DepartmentIntroductionTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentIntroductionTableViewCell")
        self.tableView.register(UINib(nibName: "DepartmentCoursesCollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentCoursesCollectionTableViewCell")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension DepartmentViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let viewModel  = self.departmentViewModel else {
            fatalError("cannot access DepartmentViewModel object")
        }
        
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel  = self.departmentViewModel else {
            fatalError("cannot access DepartmentViewModel object")
        }
        
        return viewModel.getNumberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let viewModel  = self.departmentViewModel else {
            fatalError("cannot access DepartmentViewModel object")
        }
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            return UITableView.automaticDimension
        case (1, 0):
            // MARK: TODO
            return 1000
        default:
            fatalError("should not reach here")
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel  = self.departmentViewModel else {
            fatalError("cannot access DepartmentViewModel object")
        }
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentIntroductionTableViewCell", for: indexPath) as! DepartmentIntroductionTableViewCell
            return cell
        case (1, 0):
            let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentCoursesCollectionTableViewCell", for: indexPath) as! DepartmentCoursesCollectionTableViewCell
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        default:
            fatalError("should not reach here")
        }
    }
}

extension DepartmentViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // MARK: TODO
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseCollectionViewCell", for: indexPath) as! CourseCollectionViewCell
        return cell
    }
}
