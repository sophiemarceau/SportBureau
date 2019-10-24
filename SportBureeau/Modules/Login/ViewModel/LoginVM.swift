//
//  LoginVM.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/11.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit
import SwiftyJSON
import HandyJSON

class LoginVM {
    var codeFlag:Bool! = false
    func requestData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: LOGINAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("response-result---->\(result)")

            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                User.userId = result["data","userId"].stringValue
                User.userName = result["data","userName"].stringValue
                User.cardId = result["data","cardId"].stringValue
                User.cardIdHex = result["data","cardIdHex"].stringValue
                User.loginFlag = true
                User.save()
            }else{
                let message =  result["message"].stringValue
                SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "", body: message, isHiddenBtn: true, seconds: 5)
            }
            finishedCallback()
        }
    }
    
    func requestCode(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: SendCodeAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("response-result---->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                self.codeFlag = true
               SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Success, iconImageType:.light, presentationStyleType:.top, title: "", body: "短信验证码已发送", isHiddenBtn: true, seconds: 5)
            }else{
                 self.codeFlag = false
                let message =  result["message"].stringValue
                SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "", body: message, isHiddenBtn: true, seconds: 5)
            }
            finishedCallback()
        }
    }
}


class SumVM {
    var codeStr:String!
    var totalBalance:String! 
    var nickName:String! = User.userName
    var bindCardFlag:Bool! = false
    func requestData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: SUMAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("response-result--SUMAPI-->\(result)")
            self.codeStr = result["code"].stringValue
            if self.codeStr == "200"{
                self.totalBalance = result["data","totalBalance"].stringValue
                
                
                print("totalBalance-->\(String(describing: self.totalBalance))")
                
                print("totalBalance-->\(String(describing: self.nickName))")
            }

            finishedCallback()
        }
    }
}


class ConsumerListVM {
     var listArray:[ConsumerItem]? = Array()
//    var totalBalance:String!
//    var nickName:String! = User.userName
//    var bindCardFlag:Bool! = false
    func requestData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: CONSUMERAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("ConsumerListVM-result--SUMAPI-->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                let result = JSON(result)
                //                guard let arr = result["data"] as? [[String : Any]] else { return }
                if let consumerList = JSONDeserializer<ConsumerItem>.deserializeModelArrayFrom(json: result["data"].description) {
                    self.listArray = consumerList as? [ConsumerItem]
                }
            }
            
            finishedCallback()
        }
    }
}


class BusListVM {
    var listArray:[BusItem]? = Array()
    //    var totalBalance:String!
    //    var nickName:String! = User.userName
    //    var bindCardFlag:Bool! = false
    func requestData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: BUSRECORDAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("ConsumerListVM-result--SUMAPI-->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                
                
//                guard let arr = result["data"] as? [[String : Any]] else { return }
                if let busList = JSONDeserializer<BusItem>.deserializeModelArrayFrom(json: result["data"].description) {
                    self.listArray = busList as? [BusItem]
                }
//                for dict in arr {
                
//                    let item0 = BusItem(line: "1号线", address: "国家体育总局训练局", getTime: "2010.03.09 15+58+46", carNum: "京NW3U16")
//                     weather.city = dict["ridingAddress"].stringValue
//                    let anchor = AnchorModel(dict: dict)
//                    self.hottestGroup.anchors.append(anchor)
//                }
            }
            finishedCallback()
        }
    }
}


class ConsumerQRVM {
    var resultModel:ConsumerRQResult?
    var qrFlag:Bool = false
    func requestData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: CONSUMERQRAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("CONSUMERQRAPI-result---->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                self.qrFlag = true
            }else{
                self.qrFlag = false
            }
            
            if let consumerResultModel = JSONDeserializer<ConsumerRQResult>.deserializeFrom(json:result["data"].description){
                self.resultModel = consumerResultModel
                print("CONSUMERQRAPI-result---dictionary->\(String(describing: self.resultModel))")
            }
            finishedCallback()
        }
    }
}

class BusQRVM {
    var resultModel:BusRQResult?
    var qrFlag:Bool = false
    func requestnotJsonData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestnotJsonData(.post, URLString: BUSRQRAPI, parameters: parameters) { (result) in
            let result = JSON(result)
            print("CONSUMERQRAPI-result---->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                self.qrFlag = true
                print("CONSUMERQRAPI-result---dictionary->\(result)")
            }else{
                self.qrFlag = false
            }
            if let consumerResultModel = JSONDeserializer<BusRQResult>.deserializeFrom(json:result["data"].description){
                self.resultModel = consumerResultModel
                print("CONSUMERQRAPI-result---dictionary->\(String(describing: self.resultModel))")
            }
            finishedCallback()
        }
    }
}


class OpenDoorListVM {
    
    
    var listArray:[OpenDoorItem]? = Array()
    //    var totalBalance:String!
    //    var nickName:String! = User.userName
    //    var bindCardFlag:Bool! = false
    func requestData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: API_ENTRANCE, parameters: parameters) { (result) in
            let result = JSON(result)
            print("OpenDoor-result--API_ENTRANCE-->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                let result = JSON(result)
                //                guard let arr = result["data"] as? [[String : Any]] else { return }
                if let consumerList = JSONDeserializer<OpenDoorItem>.deserializeModelArrayFrom(json: result["data"].description) {
                    self.listArray = consumerList as? [OpenDoorItem]
                }
            }
            
            finishedCallback()
        }
    }
    
    
    func requestOpenDoorData(parameters: [String : Any]? = nil,finishedCallback : @escaping () -> ()) {
        HttpTool.requestData(.post, URLString: API_OPENTHEDOOR, parameters: parameters) { (result) in
            let result = JSON(result)
            print("OpenDoor-result--API_OPENTHEDOOR-->\(result)")
            let codeStr = result["code"].stringValue
            if codeStr == "200"{
                let codeStr = result["code"].stringValue
                if codeStr == "200"{
                     SwiftMessageManager.showMessage(layoutType: .CardView, themeType:.Success, iconImageType:.light, presentationStyleType:.top, title: "", body: "开门成功", isHiddenBtn: true, seconds: 1)
                }else{
                    let message =  result["message"].stringValue
                    SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "", body: message, isHiddenBtn: true, seconds: 1)
                }
            }
            
            finishedCallback()
        }
    }
}
