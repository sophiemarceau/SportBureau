//
//  ConsumerTableViewCell.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/11.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class ConsumerTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI();
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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpUI() {
        self.contentView.addSubview(self.bgImageView)
        self.bgImageView.addSubview(self.consumerNameLabel)
        self.bgImageView.addSubview(self.arrowImageView)
        self.bgImageView.addSubview(self.timeLabel)
        self.bgImageView.addSubview(self.priceLabel)
        self.bgImageView.addSubview(self.nameLabel)
//        self.bgImageView.addSubview(self.sumLabel)
        self.bgImageView.addSubview(self.line)
        
        self.bgImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(12)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24), height: 85))
        }

        self.consumerNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(14)
            make.left.equalTo(15)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH/4), height:24/2))
        }
        
        self.arrowImageView.snp.makeConstraints { (make) in
            make.top.equalTo(12.5)
            make.right.equalTo(-15)
            make.size.equalTo(CGSize(width: (6), height:11))
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(87/2)
            make.left.equalTo(15)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24 - 30), height:12))
        }
        
//        self.sumLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(126/2)
//            make.left.equalTo(15)
//            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24 - 30), height:12))
//        }

        self.line.snp.makeConstraints { (make) in
            make.top.equalTo(61/2)
            make.left.equalTo(15)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 24 - 30), height:0.5))
        }

       self.priceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(90/2)
            make.right.equalTo(-15)
            make.size.equalTo(CGSize(width: ((SCREEN_WIDTH - 24)/2), height:12))
        }
        
        self.timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(134/2)
            make.right.equalTo(-15)
            make.size.equalTo(CGSize(width: ((SCREEN_WIDTH - 24)/2), height:10))
        }    }
    
    private lazy var bgImageView:UIImageView = {
        let bgImageView = UIImageView.init()
        bgImageView.image = UIImage(named: "矩形 2 拷贝")
        return bgImageView
    }()
    
    private lazy var consumerNameLabel:UILabel = {
        let lineLabel = UILabel.init()
        lineLabel.textColor = UIColor(hexString: blueColor)!
        lineLabel.text="1号线路"
        lineLabel.font = UIFont.systemFont(ofSize: 12.0)
        return lineLabel
    }()
    
    private lazy var timeLabel:UILabel = {
        let timeLabel = UILabel.init()
        timeLabel.textColor = UIColor(hexString: "#a09f9f")!
        timeLabel.text="2016"
        timeLabel.textAlignment = NSTextAlignment.right
        timeLabel.font = UIFont.systemFont(ofSize: 10.0)
        return timeLabel
    }()
    
    private lazy var priceLabel:UILabel = {
        let priceLabel = UILabel.init()
        priceLabel.textColor = UIColor(hexString: "#e54242")!
        priceLabel.text="-20"
        priceLabel.textAlignment = NSTextAlignment.right
        priceLabel.font = UIFont.systemFont(ofSize: 12.0)
        return priceLabel
    }()
    
    private lazy var nameLabel:UILabel = {
        let nameLabel = UILabel.init()
        nameLabel.textColor = UIColor(hexString: "#323333")!
        nameLabel.text="车牌号：京NW3u16"
        nameLabel.font = UIFont.systemFont(ofSize: 12.0)
        return nameLabel
    }()
    
//    private lazy var sumLabel:UILabel = {
//        let sumLabel = UILabel.init()
//        sumLabel.textColor = UIColor(hexString: "#323333")!
//        sumLabel.text="余额200"
//        sumLabel.font = UIFont.systemFont(ofSize: 12.0)
//        return sumLabel
//    }()
    
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
    
    
    func configUI(dataItem : ConsumerItem?){
        
        if let dataItem = dataItem {
            
            self.consumerNameLabel.text =  "\(dataItem.consumeType ?? "")消费"
            self.timeLabel.text = dataItem.createTime
            self.nameLabel.text = dataItem.posPosition
            self.priceLabel.text =  "-\(dataItem.amount ?? "")"
           
//            self.sumLabel.text =  "余额:\(dataItem.amount ?? "")"
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
}
