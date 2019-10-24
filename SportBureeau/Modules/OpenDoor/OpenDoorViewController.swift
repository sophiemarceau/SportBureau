//
//  OpenDoorViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class OpenDoorViewController: UIViewController {
//    private var listView:UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = UIColor.white
//        self.title = "搜索开门"
    
//        listView = UITableView()
//        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
//        listView.backgroundColor =  UIColor.white
////            UIColor(hexString: "#2d83b3")
//        listView.delegate = self
//        listView.dataSource = self
//        view.addSubview(listView)
//
//        let headImage = UIImage(named: "蓝牙开门确定后")
//        let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
//        let headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
//        headImageView.contentMode = .scaleAspectFill
//        headImageView.image = headImage
//        listView.tableHeaderView = headImageView
////        listView.contentInsetAdjustmentBehavior = .never
//        if #available(iOS 11.0, *) {
//            listView.contentInsetAdjustmentBehavior = .never
//        } else {
//            automaticallyAdjustsScrollViewInsets = false;
//            listView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
//        };
//
//        listView.showsVerticalScrollIndicator = false
//        listView.separatorStyle = .none
//        listView.bounces = false
//        listView.isUserInteractionEnabled = true
////        listView.addSubview(timeLabel)
//        view.addSubview(self.clearBtn)
//
//
//        self.clearBtn.snp.makeConstraints { (make) in
//            make.top.equalTo(20)
//            make.size.equalTo(CGSize(width: (60), height: navigationBarHeight - statusHeight))
//            make.left.equalTo(0)
//        }
//
////        let date = Date()
////        let timeFormatter = DateFormatter()
////        timeFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
////        timeLabel.text = timeFormatter.string(from: date)
//    }
//
//    private lazy var clearBtn:UIButton = {
//        let codeBtn = UIButton.init(type: UIButton.ButtonType.custom)
////        codeBtn.frame = UIScreen.main.bounds
//        codeBtn.backgroundColor = UIColor.clear
//        codeBtn.addTarget(self, action: #selector(loginOnClick), for: .touchUpInside)
//        return codeBtn
//    }()
//
//    private lazy var timeLabel:UILabel = {
//        let timeLabel = UILabel.init()
//        timeLabel.textAlignment = NSTextAlignment.center
//        timeLabel.textColor = UIColor(hexString: "#666666")
//        timeLabel.frame = CGRect(x:0, y: 305*SCALEX, width: (SCREEN_WIDTH), height: 15*SCALEX)
//        timeLabel.font = UIFont.systemFont(ofSize: 15*SCALEX)
//        return timeLabel
//    }()
//
//    @objc func loginOnClick(){
//        self.navigationController?.popToRootViewController(animated: true);
//    }
//
//}
//extension OpenDoorViewController:UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellid = "testCellID"
//        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
//        if cell==nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
//        }
//        return cell!
//    }
//
//}
//        self.view.addSubview(self.listView)
//        self.navigationItem.hidesBackButton = true
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarButton)
////        self.view.addSubview(self.checkLabel)
////        self.view .addSubview(self.searchBtn)
////        self.view.addSubview(self.searchLabel)
//
//        requestData()
//    }

    var listArray:[OpenDoorItem]?
    fileprivate lazy var openDoorListVM : OpenDoorListVM = OpenDoorListVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listArray = Array()
        self.title = "搜索开门"
        self.view.backgroundColor = UIColor.white
        self.navigationItem.hidesBackButton = true
        let leftBackItem:UIBarButtonItem = UIBarButtonItem.init(customView: leftBarButton)
        leftBackItem.title = ""
        self.navigationItem.leftBarButtonItem = leftBackItem
        
        self.view.addSubview(self.listView)
        
        requestData()
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
    
    private lazy var listView:UITableView = {
        let listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - tabBarHeight)
        listView.backgroundColor = UIColor.white
        listView.delegate = self
        listView.dataSource = self
        listView.rowHeight = 71
        listView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let headView = UIView()
        headView.backgroundColor = UIColor.clear
        headView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 15)
        listView.tableHeaderView = headView
        return listView
    }()
    
    @objc func goback(){
        self.navigationController?.popViewController(animated: true);
    }
}

extension OpenDoorViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(self.listArray!.count)")
        //        return self.listArray!.count
        return self.openDoorListVM.listArray!.count
        //         return self.listArray?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "OpenDoorTableViewCell"
        var cell:OpenDoorTableViewCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?OpenDoorTableViewCell
        if cell == nil {
            cell = OpenDoorTableViewCell(style: .default, reuseIdentifier: indentifier)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        }
        let itemEntity = self.openDoorListVM.listArray?[indexPath.row]
        //更改Cell的UI
        cell.configUI(dataItem: itemEntity)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let itemEntity:OpenDoorItem = (self.openDoorListVM.listArray?[indexPath.row])!
        
        let cardEntity:cartList  = itemEntity.cardList![0]
        
        requestOpenDoorData(doorString: itemEntity.doorId!, cardString: cardEntity.cardId!)
        
    }
    
    func requestData(){
        let parameters = [ "cardId": User.cardId!,"id":User.userId]
        print("request----->\(parameters)")
        openDoorListVM.requestData(parameters: parameters as [String : Any]) {
            self.listView.reloadData()
        }
    }
    
    
    func requestOpenDoorData(doorString:String,cardString:String){
        let parameters = [ "cardId":cardString,  "doorId": doorString,]
        openDoorListVM.requestOpenDoorData(parameters: parameters as [String : Any]) {
            self.listView.reloadData()
        }
    }
}
