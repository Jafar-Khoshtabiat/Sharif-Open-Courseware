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
    
    init() {
        
    }
    
    func getNumberOfSections() -> Int {
        return 3
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int {
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
    }
}
