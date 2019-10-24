//
//  BusListTableViewCell.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/11.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class BusListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI();
//        self.selectionStyle = UITableViewCell.SelectionStyle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpUI()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }


    func setUpUI() {
        self.contentView.addSubview(self.bgImageView)
        self.bgImageView.addSubview(self.lineImageView)
        self.bgImageView.addSubview(self.lineLabel)
        self.bgImageView.addSubview(self.arrowImageView)
        self.bgImageView.addSubview(self.cardNumLabel)
        self.bgImageView.addSubview(self.addressLabel)
        self.bgImageView.addSubview(self.addressTimeLabel)
        self.bgImageView.addSubview(self.line)
        
        self.bgImageView.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(0)
            make.left.equalTo(12)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24), height: 85))
    
            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }
        
        self.lineImageView.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(12)
            make.left.equalTo(15)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (14), height:14))
            
            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }
        self.lineLabel.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(14)
            make.left.equalTo(40)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH/4), height:24/2))

            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }
//
        self.cardNumLabel.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(4)
            make.right.equalTo(-34)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH/3), height:30))

            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }

        self.arrowImageView.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(13.5)
            make.right.equalTo(-15)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (6), height:11))

            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }

        self.addressLabel.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(87/2)
            make.left.equalTo(15)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24 - 30), height:12))

            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }

        self.addressTimeLabel.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(126/2)
            make.left.equalTo(15)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24 - 30), height:12))

            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }

        self.line.snp.makeConstraints { (make) in
            // 距离父视图顶部64 （一会我们会讲到 iPhone X 的安全区域布局）
            make.top.equalTo(61/2)
            make.left.equalTo(15)
            // 设置视图大小
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24 - 30), height:0.5))
            
            //            make.width.equalTo(100)
            //            make.height.equalTo(100)
            //            make.center.equalTo(self.view)
        }
//    self.titleLabel = UILabel.init()
//    self.titleLabel?.backgroundColor = UIColor.clear;
//    self.titleLabel?.frame = CGRect(x:0, y:0, width:100, height:30)
//    self.titleLabel?.text = "Title"
//    self.titleLabel?.textColor = UIColor.black
//    self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//    self.titleLabel?.textAlignment = NSTextAlignment.center
//    self.addSubview(self.titleLabel!)
//
//    self.picImgView = UIImageView()
//    self.picImgView?.frame = CGRect(x:110, y:50, width:50, height:50)
//    self.picImgView?.backgroundColor = UIColor.lightGray
//    self.picImgView?.image = UIImage.init(named: "a")
//    self.addSubview(self.picImgView!)
    
   }
    
    private lazy var bgImageView:UIImageView = {
        let bgImageView = UIImageView.init()
        bgImageView.image = UIImage(named: "矩形 2 拷贝")
        return bgImageView
    }()
    
    private lazy var lineImageView:UIImageView = {
        let lineImageView = UIImageView.init()
        lineImageView.image = UIImage(named: "班车")
        return lineImageView
    }()
    
    private lazy var lineLabel:UILabel = {
        let lineLabel = UILabel.init()
        lineLabel.textColor = UIColor(hexString: blueColor)!
        lineLabel.text="1号线路"
        lineLabel.font = UIFont.systemFont(ofSize: 12.0)
        return lineLabel
    }()
    
    private lazy var cardNumLabel:UILabel = {
        let cardNumLabel = UILabel.init()
        cardNumLabel.textColor = UIColor(hexString: blueColor)!
        cardNumLabel.text="车牌号：京NW3u16"
        cardNumLabel.textAlignment = NSTextAlignment.right
        cardNumLabel.font = UIFont.systemFont(ofSize: 12.0)
        return cardNumLabel
    }()
    
    private lazy var addressLabel:UILabel = {
        let addressLabel = UILabel.init()
        addressLabel.textColor = UIColor(hexString: "#ea6b4a")!
        addressLabel.text="车牌号：京NW3u16"
        addressLabel.font = UIFont.systemFont(ofSize: 12.0)
        return addressLabel
    }()
    
    private lazy var addressTimeLabel:UILabel = {
        let addressTimeLabel = UILabel.init()
        addressTimeLabel.textColor = UIColor(hexString: "#ea6b4a")!
        addressTimeLabel.text="车牌号：京NW3u16"
        addressTimeLabel.font = UIFont.systemFont(ofSize: 12.0)
        return addressTimeLabel
    }()
    
    private lazy var arrowImageView:UIImageView = {
        let arrowImageView = UIImageView.init()
        arrowImageView.image = UIImage(named: "形状 1 拷贝")
        return arrowImageView
    }()
    
    
    private lazy var line:UIImageView = {
        let line = UIImageView.init()
        line.backgroundColor =  UIColor(hexString: lineColor)!
        return line
    }()
    
    
    func configUI(dataItem : BusItem?){
        
        if let dataItem = dataItem {
            
            self.lineLabel.text = dataItem.ridingLine
            self.cardNumLabel.text = dataItem.busNum
            
            let strg = "乘车地点：\(dataItem.ridingAddress ?? "")"
            let ranStr = "乘车地点："
            changeColor(label: self.addressLabel, strg: strg, ranStr: ranStr)
            
            let strg1 = "乘车时间：\(dataItem.createTime ?? "")"
            let ranStr1 = "乘车时间："
            changeColor(label: self.addressTimeLabel, strg: strg1, ranStr: ranStr1)
//            //图片加载用Kingfisher第三方框架
//            self.pic.kf.setImage(with: URL(string: dataItem.thumbnail_pic_s!))
//            
//            self.title.text = dataItem.title
//            
//            self.author.text = dataItem.author_name
//            
//            self.date.text = dataItem.date
        }
    }
    
    func changeColor(label:UILabel,strg:String,ranStr:String) {
        //所有文字变为富文本
        let attrstring:NSMutableAttributedString = NSMutableAttributedString(string:strg)
        //颜色处理的范围
        let str = NSString(string: strg)
        let theRange = str.range(of: ranStr)
        //颜色处理
        attrstring.addAttribute(NSAttributedString.Key.foregroundColor, value:UIColor(hexString: "#0b0a0a")!, range: theRange)
        //行间距
        let paragraphStye = NSMutableParagraphStyle()
        paragraphStye.lineSpacing = 5
        //行间距的范围
        let distanceRange = NSMakeRange(0, CFStringGetLength(strg as CFString?))
        attrstring .addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStye, range: distanceRange)
        label.attributedText = attrstring//赋值方法
    }
}
