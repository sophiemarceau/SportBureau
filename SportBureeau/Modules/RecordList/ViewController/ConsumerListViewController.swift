//
//  ConsumerListViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class ConsumerListViewController: UIViewController {
    fileprivate lazy var consumerListVM : ConsumerListVM = ConsumerListVM()
    var listArray:[BusItem]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listArray = Array()
        self.title = "消费记录"
        self.view.backgroundColor = UIColor.white
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBarButton)
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
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT )
        listView.backgroundColor = UIColor.white
        listView.delegate = self
        listView.dataSource = self
        listView.rowHeight = 100
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


extension ConsumerListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(self.listArray!.count)")
        return self.consumerListVM.listArray!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "ConsumerTableViewCell"
        var cell:ConsumerTableViewCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?ConsumerTableViewCell
        if cell == nil {
            cell = ConsumerTableViewCell(style: .default, reuseIdentifier: indentifier)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        }
        let busItem = self.consumerListVM.listArray?[indexPath.row]
        //更改Cell的UI
        cell.configUI(dataItem: busItem)
        return cell
    }
    
    func requestData(){
        //    var todos:[Todo] = [//var todos = [Todo]()
        ////        Todo(name: "看电影", checked: false),
        ////        Todo(name: "看sophie", checked: false),
        ////        Todo(name: "看marceau", checked: false),
        ////        Todo(name: "看sophiemarceau", checked: false)
        //    ]
        
        
//        let item0 = BusItem(line: "1号线", address: "国家体育总局训练局", getTime: "2010.03.09 15+58+46", carNum: "京NW3U16")
//        let item1 = BusItem(line: "2号线", address: "国家体育总", getTime: "2010.03.09 15+58+46", carNum: "京AD85814")
//        self.listArray?.append(item0)
//        self.listArray?.append(item1)
//        
//        self.listView.reloadData()
//        let parameters = [ "cardId": "3d4c10e5",]
        
         print( User.cardId)
        print( User.cardIdHex)
        
            let parameters = [ "cardId": User.cardIdHex!,]
        print(parameters)
            consumerListVM.requestData(parameters: parameters as [String : Any]) {
            self.listView.reloadData()
        }
    }
}

