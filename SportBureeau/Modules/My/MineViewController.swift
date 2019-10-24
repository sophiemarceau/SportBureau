//
//  MineViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit


class MineViewController: UIViewController {
    fileprivate lazy var sumVM : SumVM = SumVM()
    private var listView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - tabBarHeight)
        listView.backgroundColor = UIColor.white
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
        
        let headImage = UIImage(named: "国家体育局我的页面")
        let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
        let headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
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
        
        let btn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - SCREEN_WIDTH * 1 / 3), y: 270*SCALEX, width: SCREEN_WIDTH / 3, height: 75*SCALEX ))
        btn.addTarget(self, action: #selector(self.gotoBusRecordList), for: .touchUpInside)
        headImageView.addSubview(btn)
        
        let qrbtn = UIButton.init(frame: CGRect.init(x: (0), y: 270*SCALEX, width: SCREEN_WIDTH / 3, height: 80*SCALEX ))
        qrbtn.addTarget(self, action: #selector(self.gotoRecordList), for: .touchUpInside)
        headImageView.addSubview(qrbtn)
        
        let loftBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH / 3), y: 270*SCALEX, width: SCREEN_WIDTH / 3, height: 80*SCALEX ))
        loftBtn.addTarget(self, action: #selector(self.gotoLoftList), for: .touchUpInside)
        headImageView.addSubview(loftBtn)
        
        
        let cardMangertn = UIButton.init(frame: CGRect.init(x: (0), y: (1132/2)*SCALEX, width: SCREEN_WIDTH, height: 50*SCALEX ))
        cardMangertn.addTarget(self, action: #selector(self.gotoCardManager), for: .touchUpInside)
        headImageView.addSubview(cardMangertn)
        
        let fixBtn = UIButton.init(frame: CGRect.init(x: (0), y: (1132/2+50)*SCALEX, width: SCREEN_WIDTH, height: 45*SCALEX ))
        fixBtn.addTarget(self, action: #selector(self.gotoFix), for: .touchUpInside)
        headImageView.addSubview(fixBtn)
        
        let consumerRecordBtn = UIButton.init(frame: CGRect.init(x: (0), y: (1132/2+50+45)*SCALEX, width: SCREEN_WIDTH, height: 45*SCALEX ))
        consumerRecordBtn.addTarget(self, action: #selector(self.consumerRecordList), for: .touchUpInside)
        headImageView.addSubview(consumerRecordBtn)
        var yValue = (1132/2+140) * SCALEX
        let gooutRecordBtn = UIButton.init(frame: CGRect.init(x: (0), y: yValue, width: SCREEN_WIDTH, height: 45*SCALEX ))
        gooutRecordBtn.addTarget(self, action: #selector(self.gooutRecordList), for: .touchUpInside)
        headImageView.addSubview(gooutRecordBtn)
        
        headImageView.addSubview(self.nickLbel)
        headImageView.addSubview(self.balanceLbel)
        headImageView.addSubview(self.bindBtn)
        requestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         requestData()
    }
    
    private lazy var nickLbel:UILabel = {
        let nickLbel = UILabel.init()
        nickLbel.textColor = UIColor.white
        nickLbel.frame = CGRect(x: (188)/2*SCALEX, y: 190/2*SCALEX, width: SCREEN_WIDTH/2, height: 33/2)
        nickLbel.font = UIFont.systemFont(ofSize: 16*SCALEX)
        return nickLbel
    }()
    
    private lazy var balanceLbel:UILabel = {
        let balanceLbel = UILabel.init()
        balanceLbel.textColor = UIColor(hexString: "#444444")!
        balanceLbel.frame = CGRect(x: 55*SCALEX, y: 357/2*SCALEX, width: SCREEN_WIDTH/3, height: 30/2)
        balanceLbel.font = UIFont.systemFont(ofSize: 16*SCALEX)
        return balanceLbel
    }()
    
    private lazy var bindBtn:UIButton = {
        let bindBtn = UIButton.init()
        bindBtn.addTarget(self, action: #selector(self.gotoRecordList), for: .touchUpInside)
        bindBtn.frame = CGRect(x: SCREEN_WIDTH - 100, y: 196/2*SCALEX, width: 100, height: 44)
        bindBtn.backgroundColor = UIColor.clear
        return bindBtn
    }()
    
    @objc func gotoRecordList(){
        let openDoorVC = ResturantViewController()
//            ConsumerListViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    @objc func gotoBusRecordList(){
        let openDoorVC = ServiceViewController()
        
//            BusListViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    @objc func gotoLoftList(){
        let openDoorVC = LoftServiceViewController()
        //            ConsumerListViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    
    @objc func gotoFix(){
        let openDoorVC = QuickFixViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    @objc func gotoCardManager(){
        let openDoorVC = CardManagerViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    @objc func consumerRecordList(){
        let openDoorVC = ConsumerListViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    @objc func gooutRecordList(){
        let openDoorVC = BusListViewController()
        self.navigationController?.pushViewController(openDoorVC, animated: true)
    }
    
    func requestData(){
        let parameters = ["cardId": User.cardId]
        sumVM.requestData(parameters: parameters as [String : Any]) {
            if self.sumVM.codeStr == "200" {
                 print("requestData")
                self.nickLbel.text = self.sumVM.nickName
                self.balanceLbel.text = "￥\(self.sumVM.totalBalance!)"
                
                let cardId = User.cardId
                if(cardId == "-1"){
                    self.bindBtn.backgroundColor = UIColor.clear
                    self.bindBtn.isEnabled = false
                }else{
                    self.bindBtn.backgroundColor = UIColor(hexString: "#0092D3")!
                    self.bindBtn.isEnabled = true
                }
            }
        }
    }
}

extension MineViewController:UITableViewDelegate,UITableViewDataSource{
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

