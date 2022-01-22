//
//  YJTMainSquareViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView

class YJTMainSquareViewController: YJTBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}


extension YJTMainSquareViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        self.view
    }
    
}
