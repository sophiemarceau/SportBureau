//
//  ConsumerSuccessViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class ConsumerSuccessViewController: UIViewController {
    var resultModel:ConsumerRQResult? = nil
    private var listView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        listView.backgroundColor =  UIColor(hexString: "#124a6a")
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
        
        let headImage = UIImage(named: "消费成功")
        let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
        let headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
        headImageView.contentMode = .scaleAspectFill
        headImageView.image = headImage
        listView.tableHeaderView = headImageView
//        listView.contentInsetAdjustmentBehavior = .never
        if #available(iOS 11.0, *) {
            listView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
            listView.contentInset = UIEdgeInsets.init(top: -20, left: 0, bottom: 0, right: 0)
        };
        listView.showsVerticalScrollIndicator = false
        listView.separatorStyle = .none
        listView.bounces = false
        headImageView.isUserInteractionEnabled = true
        headImageView.addSubview(blueLabel)
        headImageView.addSubview(balanceLabel)
        headImageView.addSubview(nextConsumerLabel)
        headImageView.addSubview(confirmBtn)
        
        
        blueLabel.text = "-\(self.resultModel?.amount ?? "")"
        balanceLabel.text = "￥\(self.resultModel?.balance ?? "")"
        nextConsumerLabel.text = "￥\(self.resultModel?.deptName ?? "")"
    }
    
    private lazy var blueLabel:UILabel = {
        let blueLabel = UILabel.init()
        blueLabel.textColor = UIColor(hexString: blueColor)
        blueLabel.textAlignment = NSTextAlignment.center
        blueLabel.frame = CGRect(x: 0, y: 300*SCALEX, width: SCREEN_WIDTH, height: 45/2*SCALEX)
        blueLabel.font = UIFont.systemFont(ofSize: 45/2*SCALEX)
        return blueLabel
    }()
    
//    private lazy var messageLabel:UILabel = {
//        let messageLabel = UILabel.init()
//        messageLabel.textColor = UIColor.white
//        messageLabel.frame = CGRect(x: (188)/2*SCALEX, y: 759/2*SCALEX, width: (SCREEN_WIDTH-60)/2 - 340/2, height: 34/2*SCALEX)
//        messageLabel.font = UIFont.systemFont(ofSize: 34/2*SCALEX)
//        return messageLabel
//    }()
    
    private lazy var balanceLabel:UILabel = {
        let balanceLabel = UILabel.init()
        balanceLabel.textColor = UIColor(hexString: "#666666")
        balanceLabel.frame = CGRect(x: (396)/2*SCALEX, y:757/2*SCALEX, width: (SCREEN_WIDTH-60) - 300/2, height: 34/2*SCALEX)
        balanceLabel.font = UIFont.systemFont(ofSize: 34/2*SCALEX)
        return balanceLabel
    }()
    
    private lazy var nextConsumerLabel:UILabel = {
        let nextConsumerLabel = UILabel.init()
        nextConsumerLabel.textColor = UIColor(hexString: "#666666")
        nextConsumerLabel.frame = CGRect(x: (396)/2*SCALEX, y: 820/2*SCALEX, width: (SCREEN_WIDTH-60) - 300/2, height: 34/2*SCALEX)
        nextConsumerLabel.font = UIFont.systemFont(ofSize: 16*SCALEX)
        return nextConsumerLabel
    }()
    
    
    private lazy var confirmBtn:UIButton = {
        let confirmBtn = UIButton.init(type: UIButton.ButtonType.custom)
        confirmBtn.frame = CGRect(x: (182)/2*SCALEX, y: 925/2*SCALEX, width: (SCREEN_WIDTH - (182)*SCALEX), height: 45*SCALEX)
        confirmBtn.backgroundColor = UIColor.clear
        confirmBtn.addTarget(self, action: #selector(loginOnClick), for: .touchUpInside)
        return confirmBtn
    }()
    
    @objc func loginOnClick(){
        self.navigationController?.popToRootViewController(animated: true);
    }

}
extension ConsumerSuccessViewController:UITableViewDelegate,UITableViewDataSource{
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
