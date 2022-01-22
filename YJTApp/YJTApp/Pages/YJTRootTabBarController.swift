//
//  YJTRootTabBarController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent

class YJTRootTabBarController: YJTBaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBar.scrollEdgeAppearance = tabBarAppearance
        }
        
        
        createViewControllers()
        
        self.tabBar.tintColor = hexColor(0xB4494E)
        self.tabBar.unselectedItemTintColor = hexColor(0x666666)
        if let items = tabBar.items {
            for item in items {
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 100)
                item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -10, right: 0)
            }
        }
    }
    
    private func createViewControllers() {
        
        let homeNaviVC = YJTBaseNavigationController(rootViewController: YJTMainHomeViewController())
        homeNaviVC.tabBarItem = UITabBarItem(title: "首页", image: R.image.tabBar_home(), selectedImage: R.image.tabBar_home())

        let liveNaviVC = YJTBaseNavigationController(rootViewController: YJTLiveHomeViewController())
        liveNaviVC.tabBarItem = UITabBarItem(title: "直播", image: R.image.tabBar_live(), selectedImage: R.image.tabBar_live())
        
        let messageNaviVC = YJTBaseNavigationController(rootViewController: YJTMessageHomeViewController())
        messageNaviVC.tabBarItem = UITabBarItem(title: "消息", image: R.image.tabBar_message(), selectedImage: R.image.tabBar_message())
        
        let mineNaviVC = YJTBaseNavigationController(rootViewController: YJTMineHomeViewController())
        mineNaviVC.tabBarItem = UITabBarItem(title: "我", image: R.image.tabBar_mine(), selectedImage: R.image.tabBar_mine())
        
        viewControllers = [homeNaviVC, liveNaviVC, messageNaviVC, mineNaviVC]
    }
   

}
