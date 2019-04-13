//
//  Service.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/13/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import Foundation
import Moya

enum Service {
    case sync(lastSyncTime: Int)
}

extension Service: TargetType {
    var baseURL: URL {
        guard let _baseURL = URL(string: "http://ocw.sharif.edu/api/v0") else {
            fatalError("URL is not correct")
        }
        
        return _baseURL
    }
    
    var path: String {
        switch self {
        case let .sync(lastSyncTime: lastSyncTime):
            return "/all/update/\(lastSyncTime)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        var headers = ["X-Requested-With": "XMLHttpRequest"]
        return headers
    }
}
