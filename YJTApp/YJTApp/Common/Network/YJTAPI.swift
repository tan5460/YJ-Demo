//
//  YJTAPI.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/21.
//

import Foundation
import Moya
import AdSupport





enum YJTAPI {
    case live_top_list(parameter:[String:Any])
    case auction_list_v1(parameter:[String:Any])
}



extension YJTAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://gateway-bvt.yjwh.shop")!
    }
    
    var headers: [String: String]? {
        
        var header = [String : String]()
        
        header["Content-Type"] = "application/json; charset=utf-8"
        return header
    }
    
    var validationType: ValidationType {
        .successCodes
    }

    var sampleData: Data {
        return Data()
    }

    var path: String {
        switch self {
        case .live_top_list:
            return "live/top/list"
        case .auction_list_v1:
            return "auction/list/v1"
        }
    }


    var method: Moya.Method {
        switch self {
        
        default:
            return .post
        }
    }

    var task: Task {
        //通用参数
        var param = createGeneralRequestParam()
        
        //请求参数
        switch self {
        case .live_top_list(let parameter),
            .auction_list_v1(let parameter):
            param["msg"] = parameter
        default:
            break
        }
        
        switch method {
            case .get:
                return .requestParameters(parameters: param, encoding: URLEncoding.default)
            default:
                return .requestParameters(parameters: param, encoding: JSONEncoding.default)
        }
    }


    private func createGeneralRequestParam() -> [String : Any] {
        
        var param = [String : Any]()
        
        //客户端
        let src = "3"
        param["src"] = src

        //时间戳
        let timestamp = Int(Date().timeIntervalSince1970*1000)
        param["timestamp"] = timestamp
        
        //md5
        let beforeMD5 = src + String(timestamp) + "DivJ6a5Gf@M0wxa5"
        let md5 = beforeMD5.md5
        param["md5"] = md5
        
        //客户端版本号
        let ver = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
        param["ver"] = ver
        
        //deviceIds
        let idfa = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        param["deviceIds"] = ["IDFA" : idfa]
              
        //客户端时区
        let timezoneSecondOffset = TimeZone.current.secondsFromGMT()
        let timezone = (timezoneSecondOffset >= 0 ? "+" : "") + String(timezoneSecondOffset/3600)
        param["timezone"] = timezone
        
        //运营商信息
        let carrier = YJTTools.carrier
        let carrierName = carrier?.carrierName ?? ""
        let carrierCode = (carrier?.mobileCountryCode ?? "") + (carrier?.mobileNetworkCode ?? "")
        param["carrier"] = ["name" : carrierName,
                            "code" : carrierCode]
        
//        "snapshot" : "{\"auctionListNew\":0,\"lastSnapTime\":1642750770911,\"liveListTime\":0,\"liveSquareTime\":0,\"liveTopTime\":1642750740}",
        param["snapshot"] = ""
        
//        "deviceInfo" : "2d73228d73bcc00bd11ed2a585e1c3ae2a594278"
        param["deviceInfo"] = ""
        
        return param
    }
    
}
