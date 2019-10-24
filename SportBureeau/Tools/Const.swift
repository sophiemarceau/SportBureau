//
//  Const.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import Foundation
import SwiftHEXColors

let SCREEN_SIZE = UIScreen.main.bounds.size
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCALEX = SCREEN_WIDTH/375.0
// iphone X
let isIphoneX = SCREEN_HEIGHT == 812 ? true : false
// navigationBarHeight
let navigationBarHeight : CGFloat = isIphoneX ? 88 : 64
let statusHeight = UIApplication.shared.statusBarFrame.size.height
// tabBarHeight
let tabBarHeight : CGFloat = isIphoneX ? 49 + 34 : 49
let blueColor:String = "#2c8bc5"
let grayBorderColor:String = "#cccccc"
let lineColor:String = "#f2f2f2"


let APPDefaults = UserDefaults.standard
let User = UserObject.shareSingle

let URLStr = "http://117.73.12.18:60001/wisdompark/api/"
let GETUSERAPI = "user/getUser"
let LOGINAPI = "user/login"
let SendCodeAPI = "user/sendSms"
let SUMAPI = "cpu-card/query"
let CONSUMERAPI = "consume-record/searchUserConsumeRecordDtosForApp"
let BUSRECORDAPI = "bus-record/app_list"
let CONSUMERQRAPI = "pos/consume"//消费接口
let BUSRQRAPI = "test/index"//扫码乘车接口
let API_ENTRANCE = "entrance-guard/list"//门禁接口
let API_OPENTHEDOOR = "entrance-guard/open"//门禁开门接口



