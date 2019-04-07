//
//  CourseViewModel.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/4/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import Foundation

class CourseViewModel {
    
    enum State {
        case courseIntro
        case courseVideos
    }
    
    var state: State
    let courseViewController: CourseViewController
    
    init(state: State, vc: CourseViewController) {
        self.state = state
        self.courseViewController = vc
    }
    
    func viewDidLoad() {
        self.courseViewController.displayCourseIntro(value: self.state == .courseIntro)
    }
    
    func getNumberOfSections() -> Int {
        switch self.state {
        case .courseIntro:
            return 3
        case .courseVideos:
            return 1
        }
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
        switch self.state {
        case .courseIntro:
            switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return 1
            default:
                fatalError("should not reach here")
            }
        case .courseVideos:
            switch section {
            case 0:
                return 1
            default:
                fatalError("should not reach here")
            }
        }
    }
    
    func courseIntroButtonTouchUpInsideEvent() {
        if self.state == .courseVideos {
            self.state = .courseIntro
            self.courseViewController.displayCourseIntro(value: true)
            self.courseViewController.switchTableView()
        }
    }
    
    func courseVideosButtonTouchUpInsideEvent() {
        if self.state == .courseIntro {
            self.state = .courseVideos
            self.courseViewController.displayCourseIntro(value: false)
            self.courseViewController.switchTableView()
        }
    }
    
    func getState() -> State {
        return self.state
    }
}
