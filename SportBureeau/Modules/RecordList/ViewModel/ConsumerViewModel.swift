//
//  ConsumerViewModel.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class ConsumerViewModel: NSObject {
    //这个数据是给TableView做数据源
//    var tableViewData:[DataItem]?
    
    
    // 请求推荐数据
    func requestData(_ parameters: [String : Any]?,finishCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", parameters: parameters) { (result) in
            guard let dict = result as? [String : Any] else { return }
            guard let arr = dict["data"] as? [[String : Any]] else { return }
//            self.hottestGroup.tag_name = "最热"
//            self.hottestGroup.icon_name = "home_header_hot"
//            for dict in arr {
//                let anchor = AnchorModel(dict: dict)
//                self.hottestGroup.anchors.append(anchor)
//            }
            print(dict)
            print(arr)
        }
    }
    
    
}
