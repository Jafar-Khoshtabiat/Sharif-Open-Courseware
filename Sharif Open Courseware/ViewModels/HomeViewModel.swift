//
//  HomeViewModel.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/2/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    init() {
        
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
}
