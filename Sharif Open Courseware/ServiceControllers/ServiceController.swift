//
//  ServiceController.swift
//  Sharif Open Courseware
//
//  Created by Jafar Khoshtabiat on 4/13/19.
//  Copyright © 2019 Sharif University of Technology. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

class ServiceController {
    
    func sync(successHandler: @escaping (([JSON], [JSON], [JSON])) -> ()) {
        
        MoyaProvider<Service>().request(.sync(lastSyncTime: UserDefaultsUtility.userId ?? 0), completion: { (result) in
            switch result {
            case let .success(moyaResponse):
                do {
                    let _statusCode = moyaResponse.statusCode
                    let _data = moyaResponse.data
                    let _json = try JSON(data: _data)
                    
                        print(_json)
                        print("line:\(#line): remove----------")
                    
                    let _message = _json["message"][0].stringValue
                    
                    switch _statusCode {
                    case 200 ..< 300:
                        guard let syncTime = _json["time"].int else {
                            fatalError("sync time not found in response JSON")
                        }
                        appDelegateRef.sOCWUserDefaults.
                        guard let channelsJSONArray = _json["channels"].array else {
                            fatalError("channels info not found in response JSON")
                        }
                        
                        guard let teachersJSONArray = _json["teachers"].array else {
                            fatalError("teachers info not found in respnse JSON")
                        }
                        
                        guard let coursesesJSONArray = _json["courses"].array else {
                            fatalError("courses info not found in response JSON")
                        }
                        
                        successHandler()
                        
                    default:
                        fatalError("TODO")
                    }
                } catch {
                    fatalError("TODO")
                }
            case let .failure(error):
                fatalError("TODO")
            }
        })
    }
}
