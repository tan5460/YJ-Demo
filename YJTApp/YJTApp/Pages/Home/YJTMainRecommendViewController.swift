//
//  YJTMainRecommendViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView

class YJTMainRecommendViewController: YJTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}

extension YJTMainRecommendViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        self.view
    }
    
}
