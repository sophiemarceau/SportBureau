//
//  ConsumerScanViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/12.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit
import SwiftyJSON
class ConsumerScanViewController: LBXScanViewController {
    fileprivate lazy var consumerQRVM : ConsumerQRVM = ConsumerQRVM()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "消费扫描二维码"
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarButton)
        
    }
    
    //Mark: - 导航栏左边按钮
    private lazy var leftBarButton:UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        var arrowImage:UIImage = UIImage(named: "backArrow")!
        arrowImage = arrowImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        button.setImage(arrowImage, for: .normal)
        button.sizeToFit()
        button.addTarget(self, action: #selector(goback), for: .touchUpInside)
        return button
    }()
    
    @objc func goback(){
        self.navigationController?.popViewController(animated: true);
    }
    

    /**
     处理扫码结果，如果是继承本控制器的，可以重写该方法,作出相应地处理，或者设置delegate作出相应处理
     */
    open override func handleCodeResult(arrayResult:[LBXScanResult])
    {
        if let delegate = scanResultDelegate  {
            
            self.navigationController? .popViewController(animated: true)
            let result:LBXScanResult = arrayResult[0]
            
            delegate.scanFinished(scanResult: result, error: nil)
            
        }else{
            for result:LBXScanResult in arrayResult
            {
                print("%@",result.strScanned ?? "")
                let str = result.strScanned ?? ""
                self.requestData(jsonstr: str)
            }
            
//            let result:LBXScanResult = arrayResult[0]
            
//            showMsg(title: result.strBarCodeType, message: result.strScanned)
            
        }
    }

    func requestData(jsonstr:String){
        var param = [ "cardId": User.cardIdHex!,]
        let jsonData:Data = jsonstr.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? [String:Any]
        for (key,value) in dict! {
            if key == "amount"{
                if value is NSNumber {
                    let number = NumberFormatter.init()
                    let stringZf = number.string(from: value as! NSNumber)
                    param.updateValue((stringZf!), forKey: key)
                }else{
                     param.updateValue((value as! String), forKey: key)
                }
            }else{
                 param.updateValue((value as! String), forKey: key)
            }
           
        }
        let parameters = param
        
        consumerQRVM.requestData(parameters: parameters as [String : Any]) {
//            print("consumerQRVM")
            if (self.consumerQRVM.qrFlag){
                let vc = ConsumerSuccessViewController()
                vc.resultModel = self.consumerQRVM.resultModel
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                self.showMsgAlert(title:"系统提示", message: self.consumerQRVM.resultModel?.amount)
            }
            
        }
    }
    
    
   
}
