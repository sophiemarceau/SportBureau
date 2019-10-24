//
//  BusItem.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/11.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit
import HandyJSON
struct BusItem: HandyJSON {
    var ridingLine: String?
    var ridingAddress:String?
    var createTime:String?
    var busNum:String?
}

struct ConsumerItem: HandyJSON {
    var consumeType: String?
    var posPosition:String?
    var amount:String?
//    var subsidyAmount:String?
    var createTime:String?
}


struct ConsumerRQResult: HandyJSON {
    var amount: String?
    var errorCode:Int?
    var balance:String?
    var deptName:String?
    var userName:String?
}

struct BusRQResult: HandyJSON {
    var amount: String?
    var errorCode:Int?
    var balance:String?
    var deptName:String?
    var userName:String?
}

struct OpenDoorItem:HandyJSON {
    var doorId:String?
    var doorName:String?
    var cardList:[cartList]?
}

struct cartList:HandyJSON {
    var cardId:String?
    var physicalNo:String?
}
