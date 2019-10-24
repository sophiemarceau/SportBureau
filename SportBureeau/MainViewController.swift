//
//  MainViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false  //避免受默认的半透明色影响，关闭
        self.tabBar.tintColor = UIColor(hexString: blueColor)!//设置选中颜色，这里使用黄色

        self.addChild(setupOneChildVC("HomeViewController", imageStr: "home_normal", selectImageStr: "home_selected", titleStr: "首页"))
        self.addChild(setupOneChildVC("OfficesViewController", imageStr: "office_normal", selectImageStr: "office_selected", titleStr: "办公"))
        self.addChild(setupOneChildVC("GameViewController", imageStr: "sport_normal", selectImageStr: "sport_selected", titleStr: "运动"))
        self.addChild(setupOneChildVC("CardPassViewController", imageStr: "card_normal", selectImageStr: "card_selectd", titleStr: "一卡通"))
        self.addChild(setupOneChildVC("MineViewController", imageStr: "my_normal", selectImageStr: "my_selected", titleStr: "我的"))
    }
    
    func setupOneChildVC(_ viewControllerStr: String, imageStr: String, selectImageStr: String,titleStr: String) -> UIViewController {
        let viewController = stringTOVC(vcName: viewControllerStr)!
        viewController.view.backgroundColor = UIColor.white
        
        var myImage:UIImage = UIImage(named: imageStr)!
        myImage = myImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        viewController.tabBarItem.image = myImage
        
        let normalUIColor: UIColor = UIColor(hexString: "#000000")!
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : normalUIColor]
            , for: UIControl.State.normal)
        
        let selectUIColor: UIColor = UIColor(hexString: blueColor)!
        viewController.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : selectUIColor]
            , for: UIControl.State.selected)
        
        var selectImage:UIImage = UIImage(named: selectImageStr)!;
        selectImage = selectImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        
        viewController.tabBarItem.selectedImage = selectImage
        viewController.tabBarItem.title = titleStr
        viewController.navigationItem.title = titleStr
        
        return viewController
    }
    
    func stringTOVC(vcName:String) -> UIViewController? {
        guard let nameSpage = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("没有命名空间")
            return nil
        }
        
        guard let childVcClass = NSClassFromString(nameSpage + "." + vcName) else {
            print("没有获取到对象的class")
            return nil
        }
        
        guard let childVcType = childVcClass as? UIViewController.Type else{
            print("没有获取到类型")
            return nil
        }
        
        let vc = childVcType.init()
        return vc
    }

}
