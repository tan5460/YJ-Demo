//
//  YJTMainHomeViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView
import SnapKit

class YJTMainHomeViewController: YJTBaseViewController {

    
    var containerVCList: [JXSegmentedListContainerViewListDelegate]!
    var listContainerView: JXSegmentedListContainerView!
    
    var titleSegmentView: JXSegmentedView!
    var titleSegmentViewDataSource: JXSegmentedTitleDataSource!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    private func createViews() {
        
        containerVCList = [YJTMainAttentionViewController(), YJTMainRecommendViewController(), YJTMainSquareViewController()]
        
        listContainerView = JXSegmentedListContainerView(dataSource: self)
        view.addSubview(listContainerView)
        listContainerView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        
        titleSegmentViewDataSource = JXSegmentedTitleDataSource()
        titleSegmentViewDataSource.titles = ["关注", "推荐", "藏友圈"];
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
        titleSegmentView.defaultSelectedIndex = 1;
        titleSegmentView.listContainer = listContainerView
        navigationItem.titleView = titleSegmentView;

    }
    
    


}

extension YJTMainHomeViewController: JXSegmentedViewDelegate {
    
}


extension YJTMainHomeViewController: JXSegmentedListContainerViewDataSource {
    
    func numberOfLists(in listContainerView: JXSegmentedListContainerView) -> Int {
        containerVCList.count
    }
    
    func listContainerView(_ listContainerView: JXSegmentedListContainerView, initListAt index: Int) -> JXSegmentedListContainerViewListDelegate {
        containerVCList[index]
    }
}
