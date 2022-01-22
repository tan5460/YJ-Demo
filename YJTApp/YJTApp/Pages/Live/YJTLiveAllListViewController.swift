//
//  YJTLiveAllListViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView

class YJTLiveAllListViewController: YJTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}

extension YJTLiveAllListViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        self.view
    }
    
}
