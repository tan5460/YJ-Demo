//
//  AppDelegate.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/21.
//

import UIKit
import YJTBaseComponent

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = YJTRootTabBarController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()

        
        return true
    }

    


}

