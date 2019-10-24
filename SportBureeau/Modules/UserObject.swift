//
//  UserObject.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

//全局的常量

let LOGIN_DATA_KEY:String = "loginSportBureau"

class UserObject: NSObject {
    var userId:String!
//    var token:String!
    var userName:String!
    var cardId:String!
    var cardIdHex:String!
    var loginFlag:Bool = false
    //单例
    private static let sharedInstance = UserObject()
    class var shareSingle:  UserObject {
//        var dictionary:[String:Any] = APPDefaults.dictionary(forKey: LOGIN_DATA_KEY) as! [String:Any]
       let dictionary = APPDefaults.dictionary(forKey: LOGIN_DATA_KEY)
        
        if(dictionary != nil){
            sharedInstance.userId = (dictionary?["userId"] as! String)
            sharedInstance.userName = (dictionary?["userName"] as! String)
            sharedInstance.cardId = dictionary?["cardId"] as? String
            sharedInstance.cardIdHex = dictionary?["cardIdHex"] as? String
            sharedInstance.loginFlag = dictionary!["loginFlag"] as! Bool
        }
        
        return sharedInstance
    }
    
    func save(){
        var dictionary:[String:Any] = [String:Any]()
//        dictionary["token"] = userName
        dictionary["userId"] = userId
        dictionary["userName"] = userName
        dictionary["cardId"] = cardId
        dictionary["loginFlag"] = loginFlag
        dictionary["cardIdHex"] = cardIdHex
        APPDefaults.set(dictionary, forKey: LOGIN_DATA_KEY)
        APPDefaults.synchronize()
    }
    
    func remove(){
        APPDefaults.removeObject(forKey: LOGIN_DATA_KEY)
        APPDefaults.synchronize()
    }
    
}
