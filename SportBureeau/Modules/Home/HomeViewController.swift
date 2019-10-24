//
//  HomeViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,LBXScanViewControllerDelegate {
    func scanFinished(scanResult: LBXScanResult, error: String?) {
        NSLog("scanResult:\(scanResult)")
    }
    
    private var openDoorBtn: UIButton!
    
    private var listView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - tabBarHeight)
        listView.backgroundColor = UIColor.white
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
        
        let headImage = UIImage(named: "国家首页长图2")
        let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
        let headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
        headImageView.contentMode = .scaleAspectFill
        headImageView.image = headImage
        headImageView.isUserInteractionEnabled = true
        
        let qrbtn = UIButton.init(frame: CGRect.init(x: (0), y: (80)*SCALEX, width: SCREEN_WIDTH / 3, height: 63 * SCALEX ))
        qrbtn.tag = 1001
        qrbtn.addTarget(self, action:  #selector(self.InnerStyle(sender:)), for: .touchUpInside)
        headImageView.addSubview(qrbtn)
        
        let openBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH / 3), y: (80)*SCALEX, width: SCREEN_WIDTH / 3, height: 63 * SCALEX ))
        openBtn.addTarget(self, action:  #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        openBtn.tag = 2001
        headImageView.addSubview(openBtn)
        
        let busbtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH * 2 / 3), y: (80)*SCALEX, width: SCREEN_WIDTH / 3, height: 63 * SCALEX))
        busbtn.tag = 1002
        busbtn.addTarget(self, action: #selector(self.InnerStyle(sender:)), for: .touchUpInside)
        headImageView.addSubview(busbtn)
        
        let restaurantbtn = UIButton.init(frame: CGRect.init(x: (0), y: (245)*SCALEX, width: SCREEN_WIDTH / 3, height: 70 * SCALEX ))
        restaurantbtn.tag = 2002
        restaurantbtn.addTarget(self, action:  #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(restaurantbtn)
        
        let loftBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH / 3), y: (245)*SCALEX, width: SCREEN_WIDTH / 3, height: 70 * SCALEX ))
        loftBtn.addTarget(self, action:  #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        loftBtn.tag = 2003
        headImageView.addSubview(loftBtn)

        let busLineBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH * 2 / 3), y: (245)*SCALEX, width: SCREEN_WIDTH / 3, height: 70 * SCALEX))
        busLineBtn.tag = 2004
        busLineBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(busLineBtn)
        
        let databtn = UIButton.init(frame: CGRect.init(x:  0, y: (897/2)*SCALEX, width: SCREEN_WIDTH / 2, height: 85 * SCALEX ))
        databtn.tag = 2005
        databtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(databtn)
        
//        let dietbtn = UIButton.init(frame: CGRect.init(x: (0), y: (143)*SCALEX, width: SCREEN_WIDTH , height: 50 * SCALEX))
//        dietbtn.tag = 2006
//        dietbtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
//        headImageView.addSubview(dietbtn)
        
        
        headImageView.addSubview(self.messageBtn)
        self.messageBtn.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.size.equalTo(CGSize(width: (60), height: navigationBarHeight - statusHeight))
            make.right.equalTo(0)
        }
        
//        let assetManageBtn = UIButton.init(frame: CGRect.init(x:  (SCREEN_WIDTH * 2), y: (897/2)*SCALEX, width: SCREEN_WIDTH / 2, height: 85 * SCALEX ))
//
//        assetManageBtn.tag = 2006
//        assetManageBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
//        headImageView.addSubview(assetManageBtn)
        
        listView.tableHeaderView = headImageView
        
        if #available(iOS 11.0, *) {
            listView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
            listView.contentInset = UIEdgeInsets.init(top: -20, left: 0, bottom: 0, right: 0)
        };
        listView.showsVerticalScrollIndicator = false
        listView.separatorStyle = .none
        listView.bounces = false
        
    }
    
    private lazy var messageBtn:UIButton = {
        let messageBtn = UIButton.init(type: UIButton.ButtonType.custom)
        messageBtn.backgroundColor = UIColor.clear
        messageBtn.tag = 2007
        messageBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        return messageBtn
    }()
    

    @objc func onClickServiceBtn(sender:UIButton){
        var vc: UIViewController!
        if sender.tag == 2001 {
            vc = OpenDoorViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2002 {
            vc = ResturantViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if sender.tag == 2003 {
            vc = LoftServiceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2004 {
            vc = ServiceViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2005 {
            vc = dataDriverViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2006 {
            vc = DietViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2007 {
            vc = MessageViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
     @objc func InnerStyle(sender:UIButton){
        print(sender.tag)
        //设置扫码区域参数
        var style = LBXScanViewStyle()
        style.centerUpOffset = 44
        style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle.On
        style.photoframeLineW = 6
        style.photoframeAngleW = 24
        style.photoframeAngleH = 24
        style.isNeedShowRetangle = true
        
        style.anmiationStyle = LBXScanViewAnimationStyle.NetGrid
        
        //矩形框离左边缘及右边缘的距离
        style.xScanRetangleOffset = 80
        
        //使用的支付宝里面网格图片
        style.animationImage = UIImage(named: "CodeScan.bundle/qrcode_scan_part_net")
        let vc: LBXScanViewController!
        if sender.tag == 1001 {
            vc = ConsumerScanViewController()
        }else{
            vc = BusScanViewController()
        }
        
        vc.scanStyle = style
        
        vc.isOpenInterestRect = true
        //TODO:待设置框内识别
        self.navigationController?.pushViewController(vc, animated: true)

        }
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellid = "testCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellid)
        if cell==nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        return cell!
    }
}
