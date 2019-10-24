//
//  AppDelegate.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        print(User.cardId)
//        print(User.userName)
//        print(User.loginFlag)
        let nc = NotificationCenter.default
        //添加通知，通知处理尽量
        nc.addObserver(forName:NSNotification.Name(rawValue: "loginsuccess"), object:nil, queue:nil, using:catchNotification)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.setupKeyWindow()
        return true
    }
    
    func catchNotification(notification:Notification) -> Void {
        print("Catch notification")
//        //guard语句和if语句有点类似，都是根据其关键字之后的表达式的布尔值决定下一步执行什么。但与if语句不同的是，guard语句只会有一个代码块，不像if语句可以if else多个代码块。
//        //userInfo变量的作用域是在整个方法体内
//        //guard方法可以自动解包
//        guard let userInfo = notification.userInfo,
//            let message = userInfo["message"] ,
//            let date = userInfo["date"] else {
//                print("No userInfo found in notification")
//                return
//        }
        self.setupKeyWindow()
    }
    
    func setupKeyWindow() -> Void {UIView.transition(with: self.window!, duration: 0.35, options: .transitionCrossDissolve, animations: {
        
           let oldState = UIView.areAnimationsEnabled
            UIView.setAnimationsEnabled(false)
            let rootVC:UIViewController!
            if (User.loginFlag) {
                rootVC = MainViewController()
            }else{
                rootVC = LoginViewController()
            }
            let navVC = BaseNavigationViewController.init(rootViewController: rootVC)
            self.window?.rootViewController = navVC
            UIView.setAnimationsEnabled(oldState)
        }, completion: nil)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

