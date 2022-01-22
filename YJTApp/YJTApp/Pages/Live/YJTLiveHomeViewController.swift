//
//  YJTLiveHomeViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView
import SnapKit
import Foundation

class YJTLiveHomeViewController: YJTBaseViewController {

    var containerVCList: [JXSegmentedListContainerViewListDelegate]!
    var listContainerView: JXSegmentedListContainerView!
    
    var titleSegmentView: JXSegmentedView!
    var titleSegmentViewDataSource: JXSegmentedTitleDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "直播"
        createViews()
    }
    
    private func createViews() {
        containerVCList = [YJTLiveTopListViewController(), YJTLiveAllListViewController()]
        
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        view.addSubview(listContainerView)
        listContainerView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        titleSegmentViewDataSource = JXSegmentedTitleDataSource()
        titleSegmentViewDataSource.titles = ["精选直播", "全部直播"];
        titleSegmentViewDataSource.titleNormalFont = .systemFont(ofSize: 16, weight: .medium)
        titleSegmentViewDataSource.titleNormalColor = hexColor(0x666666)
        titleSegmentViewDataSource.titleSelectedColor = hexColor(0x333333)
        titleSegmentViewDataSource.isTitleColorGradientEnabled = true
        titleSegmentViewDataSource.isTitleZoomEnabled = true
        titleSegmentViewDataSource.titleSelectedZoomScale = 20.0/16.0
        
        titleSegmentView = JXSegmentedView()
        titleSegmentView.bounds = CGRect(x: 0, y: 0, width: 250, height: 44)
        titleSegmentView.delegate = self
        titleSegmentView.dataSource = titleSegmentViewDataSource
        titleSegmentView.defaultSelectedIndex = 0;
        titleSegmentView.listContainer = listContainerView
        navigationItem.titleView = titleSegmentView;

    }
    
    


}

extension YJTLiveHomeViewController: JXSegmentedViewDelegate {
    
}


extension YJTLiveHomeViewController: JXSegmentedListContainerViewDataSource {
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        containerVCList.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        containerVCList[index]
    }
}
