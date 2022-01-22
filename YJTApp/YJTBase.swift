//
//  YJTBase.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/21.
//

import Foundation

import CommonCrypto

import CoreTelephony


extension String {
    
    var md5: String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce(""){$0 + String(format: "%02x", $1)}
    }
    
}



class YJTTools: NSObject {
    
    
    static var carrier: CTCarrier?
    
    static func reloadCarrier() {
        var carrier: CTCarrier?
        
        if #available(iOS 12.0, *) {
            if let carrierList = CTTelephonyNetworkInfo().serviceSubscriberCellularProviders?.values {
                for tempCarrier in carrierList {
                    if let _ = tempCarrier.isoCountryCode {
                        carrier = tempCarrier
                    }
                }
            }
        } else {
            if let tempCarrier = CTTelephonyNetworkInfo().subscriberCellularProvider, let _ = tempCarrier.isoCountryCode {
                carrier = tempCarrier
            }
        }
        
        YJTTools.carrier = carrier
    }
    
}
