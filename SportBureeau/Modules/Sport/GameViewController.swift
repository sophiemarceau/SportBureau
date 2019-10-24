//
//  GameViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/4/25.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit


class GameViewController: UIViewController {
    private var listView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        listView = UITableView()
        listView.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - tabBarHeight)
        listView.backgroundColor = UIColor.white
        listView.delegate = self
        listView.dataSource = self
        view.addSubview(listView)
        
        let headImage = UIImage(named: "国家体育局运动长图页面")
        let headHeight = CGFloat(SCREEN_WIDTH /  ((headImage?.size.width)! / (headImage?.size.height)!))
        let headImageView =  UIImageView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: headHeight))
        headImageView.contentMode = .scaleAspectFill
        headImageView.image = headImage
         headImageView.isUserInteractionEnabled = true
        
        let restaurantbtn = UIButton.init(frame: CGRect.init(x: (0), y: (195)*SCALEX, width: SCREEN_WIDTH / 3, height: 80 * SCALEX ))
        restaurantbtn.tag = 2002
        restaurantbtn.addTarget(self, action:  #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        
        headImageView.addSubview(restaurantbtn)
        
        let loftBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH / 3), y: (195)*SCALEX, width: SCREEN_WIDTH / 3, height: 80 * SCALEX ))
        loftBtn.addTarget(self, action:  #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        loftBtn.tag = 2003
        headImageView.addSubview(loftBtn)
        
        let busLineBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH * 2 / 3), y: (195)*SCALEX, width: SCREEN_WIDTH / 3, height: 80 * SCALEX))
        busLineBtn.tag = 2004
        busLineBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(busLineBtn)
        
        
        let trainBtn = UIButton.init(frame: CGRect.init(x: (0), y: (275)*SCALEX, width: SCREEN_WIDTH / 2, height: 85 * SCALEX ))
        trainBtn.addTarget(self, action:  #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        trainBtn.tag = 2005
        headImageView.addSubview(trainBtn)
        
        let trainGoalBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH / 2), y: (275)*SCALEX, width: SCREEN_WIDTH / 2, height: 85 * SCALEX))
        trainGoalBtn.tag = 2006
        trainGoalBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(trainGoalBtn)
        
        
        let techAnylsisBtn = UIButton.init(frame: CGRect.init(x: (0), y: (400)*SCALEX, width: SCREEN_WIDTH / 2, height: 65 * SCALEX))
        techAnylsisBtn.tag = 2007
        techAnylsisBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(techAnylsisBtn)
        
        let athleteInfoBtn = UIButton.init(frame: CGRect.init(x: (15), y: (1038/2)*SCALEX, width: ((SCREEN_WIDTH - 30) / 3), height: 165/2 * SCALEX))
        athleteInfoBtn.tag = 2008
        athleteInfoBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(athleteInfoBtn)
        
        let injuryHealthBtn = UIButton.init(frame: CGRect.init(x: (15 + ((SCREEN_WIDTH - 30) / 3)), y: (1038/2)*SCALEX, width: ((SCREEN_WIDTH - 30) / 3), height: 165/2 * SCALEX))
        injuryHealthBtn.tag = 2009
        injuryHealthBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(injuryHealthBtn)
        
        let xx:CGFloat = SCREEN_WIDTH - 15 - ((SCREEN_WIDTH - 30) / 3)
        let yy:CGFloat = (1038/2)*SCALEX
        let dietWidth:CGFloat = (SCREEN_WIDTH - 30) / 3
        let dietHeight:CGFloat = 165/2 * SCALEX
        let dietBtn = UIButton.init(frame: CGRect.init(x: xx, y: yy, width: dietWidth, height: dietHeight))
        dietBtn.tag = 2010
        dietBtn.addTarget(self, action: #selector(self.onClickServiceBtn(sender:)), for: .touchUpInside)
        headImageView.addSubview(dietBtn)
        
        listView.tableHeaderView = headImageView
//        listView.contentInsetAdjustmentBehavior = .never
        listView.showsVerticalScrollIndicator = false
        if #available(iOS 11.0, *) {
            listView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false;
            listView.contentInset = UIEdgeInsets.init(top: -20, left: 0, bottom: 0, right: 0)
        };
        listView.separatorStyle = .none
        listView.bounces = false
    }

    
    @objc func onClickServiceBtn(sender:UIButton){
        var vc: UIViewController!
        
        
        if sender.tag == 2002 {
            vc = ExerciseViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if sender.tag == 2003 {
            vc = KnowledgeGraphViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2004 {
            vc = SearchViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }

        if sender.tag == 2005 {
            vc = TrainViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if sender.tag == 2006 {
            vc = TrainGoalViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2007 {
            vc =
//                TestViewController()
                TechAnylsisViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2008 {
            vc = AthleteInfoViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2009 {
            vc = InjuryHealthViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        if sender.tag == 2010{
            vc = DietViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
//        if sender.tag == 2010 {
//            vc = AthleteInfoViewController()
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        
    }
}
extension GameViewController:UITableViewDelegate,UITableViewDataSource{
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

