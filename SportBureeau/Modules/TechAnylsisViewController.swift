//
//  TechAnylsisViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/26.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class TechAnylsisViewController: UIViewController {
    
    private var listView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        listView.backgroundColor =  UIColor.white
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
        
        let headImage = UIImage(named: "技战术页面1")
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
        listView.isUserInteractionEnabled = true
        
        view.addSubview(self.clearBtn)
        
        self.clearBtn.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.size.equalTo(CGSize(width: (60), height: navigationBarHeight - statusHeight))
            make.left.equalTo(0)
        }
        
        view.addSubview(self.firsrtBtn)
        view.addSubview(self.secBtn)
        
        self.firsrtBtn.snp.makeConstraints { (make) in
            make.top.equalTo(263/2)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH), height: 145/2*SCALEX))
            make.left.equalTo(0)
        }
        
        self.secBtn.snp.makeConstraints { (make) in
            make.top.equalTo(440/2)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH), height: 145/2*SCALEX))
            make.left.equalTo(0)
        }
    }
    
    private lazy var clearBtn:UIButton = {
        let codeBtn = UIButton.init(type: UIButton.ButtonType.custom)
        codeBtn.backgroundColor = UIColor.clear
        codeBtn.addTarget(self, action: #selector(loginOnClick), for: .touchUpInside)
        return codeBtn
    }()
    
    private lazy var firsrtBtn:UIButton = {
        let firsrtBtn = UIButton.init(type: UIButton.ButtonType.custom)
        firsrtBtn.backgroundColor = UIColor.clear
        firsrtBtn.tag = 2001
        firsrtBtn.addTarget(self, action: #selector(detail(sender:)), for: .touchUpInside)
        return firsrtBtn
    }()
    
    private lazy var secBtn:UIButton = {
        let secBtn = UIButton.init(type: UIButton.ButtonType.custom)
        secBtn.backgroundColor = UIColor.clear
        secBtn.tag = 2002
        secBtn.addTarget(self, action: #selector(detail(sender:)), for: .touchUpInside)
        return secBtn
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
    
   
    
    @objc func detail(sender:UIButton){
        let vc: AnylsisDetailViewController = AnylsisDetailViewController()
        if sender.tag == 2001 {
            vc.imageName = "3级技术分析1"
            self.navigationController?.pushViewController(vc, animated: false)
        }
        
        if sender.tag == 2002 {
            vc.imageName = "3级技术分析2"
            self.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
}
extension TechAnylsisViewController:UITableViewDelegate,UITableViewDataSource{
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


