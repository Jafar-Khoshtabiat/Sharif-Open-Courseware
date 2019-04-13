//
//  UserDefaultsUtility.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/13/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import Foundation

class UserDefaultsUtility {
    
    static var userId: Int? {
        get {
            let _userId = appDelegateRef.sOCWUserDefaults.integer(forKey: "lastSyncTime")
            if _userId != 0 {
                return _userId
            } else {
                return nil
            }
        }
        
        set {
            appDelegateRef.sOCWUserDefaults.set(newValue, forKey: "lastSyncTime")
        }
    }
    
    static func resetUserDefaults() {
        appDelegateRef.sOCWUserDefaults.removeObject(forKey: "lastSyncTime")
    }
}
