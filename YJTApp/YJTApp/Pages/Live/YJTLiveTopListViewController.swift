//
//  YJTLiveTopListViewController.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import YJTBaseComponent
import JXSegmentedView

class YJTLiveTopListViewController: YJTBaseViewController {
    
    var collectionView: UICollectionView!
    var dataList = [YJTLiveDetailModel]()
    var pageNum = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        createViews()
    }
    
    private func createViews() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.bounds.width - 20, height: (view.bounds.width - 20) * 226.0/355.0);
        layout.minimumLineSpacing = 12;
        layout.sectionInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0);
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.mj_header = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: #selector(reloadDataList))
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
    }
    
    @objc private func reloadDataList() {
        YJTLiveDetailModel.requestLiveTopList(pageNum: 1) {[weak self] modelList in
            self?.pageNum = 1
            self?.dataList.removeAll()
            self?.dataList.append(contentsOf: modelList)
            self?.collectionView.mj_header?.endRefreshing()
            self?.collectionView.reloadData()
            if modelList.isEmpty {
                self?.collectionView.mj_footer = nil;
            } else {
                self?.collectionView.mj_footer = MJRefreshAutoGifFooter(refreshingTarget: self!, refreshingAction: #selector(self!.loadMoreDataList))
            }
        }
    }
    
    @objc private func loadMoreDataList() {
        
    }


}

extension YJTLiveTopListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}

extension YJTLiveTopListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .lightGray
        return cell
    }
    
    
}

extension YJTLiveTopListViewController: JXSegmentedListContainerViewListDelegate {
    
    func listView() -> UIView {
        self.view
    }
    
}
