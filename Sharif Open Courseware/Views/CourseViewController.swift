//
//  CourseViewController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/4/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {

    @IBOutlet weak var topBarTitleLabel: UILabel!
    @IBOutlet weak var topImageContainerView: UIView!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var departmentNameLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var courseIntroView: UIView!
    @IBOutlet weak var courseVideosView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var courseViewModel: CourseViewModel?
    
    var state: State? {
        didSet {
            guard let _state = self.state else {
                fatalError("this variable can't be nil")
            }
            
            switch _state {
            case .courseIntro:
                self.courseIntroView.isHidden = false
                self.courseVideosView.isHidden = true
            case .courseVideos:
                self.courseIntroView.isHidden = true
                self.courseVideosView.isHidden = false
            default:
                fatalError("should not reach here")
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.allowsSelection = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "DepartmentIntroductionTableViewCell", bundle: nil), forCellReuseIdentifier: "DepartmentIntroductionTableViewCell")
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
        guard let _state = self.state else {
            fatalError("this variable can't be nil")
        }
        
        if _state == .courseVideos {
            self.state = .courseIntro
        }
    }
    
    @IBAction func courseVideosButtonTouchUpInside(_ sender: UIButton) {
        guard let _state = self.state else {
            fatalError("this variable can't be nil")
        }
        
        if _state == .courseIntro {
            self.state = .courseVideos
        }
    }
}

extension CourseViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}
