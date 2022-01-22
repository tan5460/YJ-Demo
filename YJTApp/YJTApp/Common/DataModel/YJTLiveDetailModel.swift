//
//  YJTLiveDetailModel.swift
//  YJTApp
//
//  Created by YJ-T on 2022/1/22.
//

import HandyJSON

///直播详情
struct YJTLiveDetailModel: HandyJSON {

    var countdown: Int?
    var followResult: Int?
    var hasCoupon: Int?
    var isAuctionMeeting: Int?
    var isOfficial: Int?
    var liveCoverImg: String?
    var liveType: Int?
    var rank: Int?
    var ratio: Int?
    var redPacketEndTime: Int?
    var redPacketId: Int?
    var restTime: Int?
    var status: Int?
    var title: String?
    var userId: Int?
    var userImg: String?
    var userName: String?
    var weightOrder: Int?
    
    
    
    
    
    /// 精选直播列表
    /// - Parameters:
    ///   - pageNum: 分页页码  默认每页10条数据
    ///   - complete: 请求完成回调，返回模型数组
    static func requestLiveTopList(pageNum: Int, complete: ((_ modelList: [YJTLiveDetailModel]) -> ())?) {
        let param = ["pgNo" : pageNum > 0 ? pageNum : 1,
                     "num" : 10]
        YJTRequest(.live_top_list(parameter: param)) { msg in
            let modelList = [YJTLiveDetailModel].deserialize(from: msg as? Array<Any>) ?? []
            let tempList = modelList.compactMap{$0}
            complete?(tempList)
        } failure: { code, desc in
            complete?([])
        }
    }
    
    
    
    
}
