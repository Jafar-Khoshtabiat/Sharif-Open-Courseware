//
//  HomeViewModel.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/2/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    let homeViewController: HomeViewController
    
    init(vc: HomeViewController) {
        self.homeViewController = vc
    }
    
    func coursesButtonTouchUpInsideEvent() {
        self.homeViewController.state = .courses
    }
    
    func teachersButtonTouchUpInsideEvent() {
        self.homeViewController.state = .teachers
    }
    
    func myCoursesButtonTouchUpInsideEvent() {
        self.homeViewController.state = .myCourses
    }
    
    func getNumberOfSections() -> Int {
        return 2
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 2
        default:
            fatalError("should not reach here")
        }
    }
    
    func departmentViewModelFactory() -> DepartmentViewModel {
        return DepartmentViewModel()
    }
    
    func courseViewModelFactory(vc: CourseViewController) -> CourseViewModel {
        return CourseViewModel(state: .courseIntro, vc: vc)
    }
}
