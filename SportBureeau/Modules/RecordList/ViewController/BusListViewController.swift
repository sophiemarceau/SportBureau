//
//  BusListViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class BusListViewController: UIViewController {
    var listArray:[BusItem]?
    fileprivate lazy var busVM : BusListVM = BusListVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listArray = Array()
        self.title = "乘车记录"
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

extension BusListViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("\(self.listArray!.count)")
//        return self.listArray!.count
        return self.busVM.listArray!.count
//         return self.listArray?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indentifier = "BusListTableViewCell"
        var cell:BusListTableViewCell! = tableView.dequeueReusableCell(withIdentifier: indentifier)as?BusListTableViewCell
        if cell == nil {
            cell = BusListTableViewCell(style: .default, reuseIdentifier: indentifier)
            cell.selectionStyle = UITableViewCell.SelectionStyle.none;
        }
        let busItem = self.busVM.listArray?[indexPath.row]
        //更改Cell的UI
        cell.configUI(dataItem: busItem)
        return cell
    }
    
    func requestData(){
        let parameters = [ "cardId": User.cardId!,]
        busVM.requestData(parameters: parameters as [String : Any]) {
            self.listView.reloadData()
        }

    }
}



    
    

