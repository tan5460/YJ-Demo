//
//  YJTMainAttentionViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView

class YJTMainAttentionViewController: YJTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    
}


extension YJTMainAttentionViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        self.view
    }
    
}
