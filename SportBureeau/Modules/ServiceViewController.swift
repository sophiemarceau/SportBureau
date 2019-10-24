//
//  ServiceViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/12.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit


class ServiceViewController: UIViewController {
    private var headImageView:UIImageView! = nil
    private var listView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        listView.backgroundColor =  UIColor.white
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
        
        let headImage = UIImage(named: "BusService")
        let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
        headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
        headImageView.contentMode = .scaleAspectFill
        headImageView.image = headImage
         headImageView.isUserInteractionEnabled = true
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
        listView.isUserInteractionEnabled = true
        
        view.addSubview(self.clearBtn)
         view.addSubview(self.leftBtn)
         view.addSubview(self.rightBtn)
        //        print("\(statusHeight)")
        self.clearBtn.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.size.equalTo(CGSize(width: (60), height: navigationBarHeight - statusHeight))
            make.left.equalTo(0)
        }
        
        self.leftBtn.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.size.equalTo(CGSize(width: ((60)*SCALEX), height: (40)*SCALEX))
            make.left.equalTo(75)
        }
        
        self.rightBtn.snp.makeConstraints { (make) in
            make.top.equalTo(64)
            make.size.equalTo(CGSize(width: ((60)*SCALEX), height: (40)*SCALEX))
            
            make.right.equalTo((-75))
        }
       
    }
    
    private lazy var clearBtn:UIButton = {
        let codeBtn = UIButton.init(type: UIButton.ButtonType.custom)
        codeBtn.backgroundColor = UIColor.clear
        codeBtn.addTarget(self, action: #selector(loginOnClick), for: .touchUpInside)
        return codeBtn
    }()
    
    private lazy var leftBtn:UIButton = {
        let leftBtn = UIButton.init(type: UIButton.ButtonType.custom)
        leftBtn.backgroundColor = UIColor.clear
        leftBtn.tag = 2001
        leftBtn.addTarget(self, action: #selector(self.switchLoft(sender:)), for: .touchUpInside)
        return leftBtn
    }()
    
    
    private lazy var rightBtn:UIButton = {
        let rightBtn = UIButton.init(type: UIButton.ButtonType.custom)
        rightBtn.backgroundColor = UIColor.clear
        rightBtn.tag = 2002
        rightBtn.addTarget(self, action: #selector(self.switchLoft(sender:)), for: .touchUpInside)
        return rightBtn
    }()
    
    private lazy var timeLabel:UILabel = {
        let timeLabel = UILabel.init()
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.textColor = UIColor(hexString: "#666666")
        timeLabel.frame = CGRect(x:0, y: 305*SCALEX, width: (SCREEN_WIDTH), height: 15*SCALEX)
        timeLabel.font = UIFont.systemFont(ofSize: 15*SCALEX)
        return timeLabel
    }()
    
    @objc func loginOnClick(){
        self.navigationController?.popViewController(animated: true);
    }
    
    @objc func switchLoft(sender:UIButton){
        if sender.tag == 2001 {
            let headImage = UIImage(named: "BusService")
            let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
            headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
            headImageView.contentMode = .scaleAspectFill
            headImageView.image = headImage
            listView.tableHeaderView = headImageView
        } else {
            let headImage = UIImage(named: "8881558879140_.pic")
            let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
            headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
            headImageView.contentMode = .scaleAspectFill
            headImageView.image = headImage
            listView.tableHeaderView = headImageView
        }
    }
    
}
extension ServiceViewController:UITableViewDelegate,UITableViewDataSource{
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
