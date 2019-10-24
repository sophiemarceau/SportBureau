//
//  BaseNavigationViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit


class BaseNavigationViewController: UINavigationController {
    private var shadowImageView: UIImageView?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.navigationBar.barTintColor = UIColor(hexString: blueColor)!
        let textAttr = [ NSAttributedString.Key.foregroundColor: UIColor.white ]
        UINavigationBar.appearance().titleTextAttributes = textAttr
        
        
     //   2017年12月27日10:50:22  更新下最新的解决方案：最近发现隐藏状态栏以后 老板说不好看，所以 我在考虑把状态栏显示出来 同时解决状态栏变白的问题，最后还是在navigationcontroller里面更改我的APP是自定义的navigationcontroller 里面在

        
//       let statusView = UIView.init(frame: CGRect(x: 0, y: -20, width: SCREEN_WIDTH, height: 20))
//        statusView.backgroundColor = UIColor.green
//        self.navigationBar.addSubview(statusView)
    }
    
}

extension BaseNavigationViewController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let name =  type(of: viewController).description()
        var vcName:String
        if(name.contains(".")){
            vcName = name.components(separatedBy: ".")[1];
        }else{
            vcName = name
        }
        
        if vcName == "ConsumerScanViewController" || vcName == "LoginViewController" || vcName == "BusListViewController" || vcName == "ConsumerListViewController" || vcName == "BusScanViewController" || vcName == "OpenDoorViewController"{
            self.setNavigationBarHidden(false, animated: animated)
            return
        }

        self.setNavigationBarHidden(true, animated: animated)
        print("navigationController--->\(vcName)")
    }
}
