//
//  HttpTool.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class HttpTool: NSObject {

    //参数的finishedCallback闭包在26行使用了，而使用的环境又是一个闭包，则需要加@escaping
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        let headers: HTTPHeaders = [
            "Content-Type":"application/json",
            "Accept": "application/json"
        ]
        let requestURLStr = "\(URLStr)\(URLString)"
        print("request----->\(requestURLStr)")
        Alamofire.request(requestURLStr, method: method,
                          parameters: parameters,
                          encoding: JSONEncoding.default,headers:headers)
            .validate(statusCode: 200..<300)
            .responseData { response in
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")                         // response serialization result
                
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
                guard let result = response.result.value else {
                    print(response.result.error!)
                    return
                }
                finishedCallback(result)
        }
    }
    
    
    
    
    //参数的finishedCallback闭包在26行使用了，而使用的环境又是一个闭包，则需要加@escaping
    class func requestnotJsonData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
//        let headers: HTTPHeaders = [
//            "Content-Type":"application/json",
//            "Accept": "application/json"
//        ]
        let requestURLStr = "\(URLStr)\(URLString)"
        print("requestnotJsonData----->\(requestURLStr)")
        
        
        Alamofire.request(requestURLStr, method:method, parameters: parameters).validate(statusCode: 200..<300)
            .responseData { response in
                print("Response:requestnotJsonData \(String(describing: response.response))") // http url response
                print("Result:requestnotJsonData \(response.result)")                         // response serialization result
                
                if let json = response.result.value {
                    print("JSON:requestnotJsonData \(json)") // serialized json response
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data:requestnotJsonData \(utf8Text)") // original server data as UTF8 string
                }
                guard let result = response.result.value else {
                    print(response.result.error!)
                    return
                }
                finishedCallback(result)
        }
    }
}
