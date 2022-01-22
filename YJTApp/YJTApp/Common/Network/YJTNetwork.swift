//
//  YJTNetwork.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/21.
//

import Foundation
import Moya


let provider = MoyaProvider<YJTAPI>()


func YJTRequest(_ target: YJTAPI, success: @escaping (_ msg: Any?) -> (), failure: ((_ code: Int, _ desc: String) -> ())?) {
    provider.request(target) { result in
        switch result {
        case let .success(response):
//            let jsonString = String(data: response.data, encoding: .utf8) ?? ""
            if let jsonObject = try? JSONSerialization.jsonObject(with: response.data, options: .fragmentsAllowed) as? [String : Any] {
                let retn = jsonObject["retn"] as? Int ?? -1
                if retn == 0 {
                    success(jsonObject["msg"])
                } else {
                    failure?(retn, jsonObject["desc"] as? String ?? "")
                }
            }
        case let .failure(error):
            failure?(error.errorCode, error.errorDescription ?? "")
        }
    }
}
