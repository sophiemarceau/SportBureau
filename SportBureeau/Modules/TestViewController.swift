//
//  TestViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/27.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    var modelArray : [DXCellModel] = []
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: CGRect.init(x: 0, y: 20, width: kScreenW, height: kScreenH-20), style: .plain)
        table.sectionHeaderHeight = 0
        table.sectionFooterHeight = 0
        table.dataSource = self
        table.delegate = self
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let strings = ["AFNetworking is a delightful networking library for iOS and Mac OS X. It's built on top of the Foundation URL Loading System, extending the powerful high-level networking abstractions built into Cocoa. It has a modular architecture with well-designed, feature-rich APIs that are a joy to use. Perhaps the most important feature of all, however, is the amazing community of developers who use and contribute to AFNetworking every day. AFNetworking powers some of the most popular and critically-acclaimed apps on the iPhone, iPad, and Mac. Choose AFNetworking for your next project, or migrate over your existing projects—you'll be happy you did!",
                       
                       "欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。",
                       
                       "★タクシー代がなかったので、家まで歩いて帰った。★もし事故が発生した场所、このレバーを引いて列车を止めてください。（丁）为了清楚地表示出一个短语或句节，其后须标逗号。如：★この薬を、夜寝る前に一度、朝起きてからもう一度、饮んでください。★私は、空を飞ぶ鸟のように、自由に生きて行きたいと思った。*****为了清楚地表示词语与词语间的关系，须标逗号。标注位置不同，有时会使句子的意思发生变化。如：★その人は大きな音にびっくりして、横から飞び出した子供にぶつかった。★その人は、大きな音にびっくりして横から飞び出した子供に、ぶつかった。",
                       
                       "Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth; Then took the other, as just as fair, And having perhaps the better claim, Because it was grassy and wanted wear; Though as for that the passing there Had worn them really about the same, And both that morning equally lay In leaves no step had trodden black. Oh, I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I- I took the one less traveled by, And that has made all the difference. ",
                       
                       "Star \"https://github.com/boai\" :)",
                       "AFNetworking is a delightful networking library for iOS and Mac OS X. It's built on top of the Foundation URL Loading System, extending the powerful high-level networking abstractions built into Cocoa. It has a modular architecture with well-designed, feature-rich APIs that are a joy to use. Perhaps the most important feature of all, however, is the amazing community of developers who use and contribute to AFNetworking every day. AFNetworking powers some of the most popular and critically-acclaimed apps on the iPhone, iPad, and Mac. Choose AFNetworking for your next project, or migrate over your existing projects—you'll be happy you did!",
                       
                       "欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。",
                       
                       "★タクシー代がなかったので、家まで歩いて帰った。★もし事故が発生した场所、このレバーを引いて列车を止めてください。（丁）为了清楚地表示出一个短语或句节，其后须标逗号。如：★この薬を、夜寝る前に一度、朝起きてからもう一度、饮んでください。★私は、空を飞ぶ鸟のように、自由に生きて行きたいと思った。*****为了清楚地表示词语与词语间的关系，须标逗号。标注位置不同，有时会使句子的意思发生变化。如：★その人は大きな音にびっくりして、横から飞び出した子供にぶつかった。★その人は、大きな音にびっくりして横から飞び出した子供に、ぶつかった。",
                       
                       "Two roads diverged in a yellow wood, And sorry I could not travel both And be one traveler, long I stood And looked down one as far as I could To where it bent in the undergrowth; Then took the other, as just as fair, And having perhaps the better claim, Because it was grassy and wanted wear; Though as for that the passing there Had worn them really about the same, And both that morning equally lay In leaves no step had trodden black. Oh, I kept the first for another day! Yet knowing how way leads on to way, I doubted if I should ever come back. I shall be telling this with a sigh Somewhere ages and ages hence: Two roads diverged in a wood, and I- I took the one less traveled by, And that has made all the difference. ",
                       
                       "Star \"https://github.com/boai\" :)"];
        
        for i in 0..<strings.count {
            let model = DXCellModel(contentStr : strings[i])
            modelArray.append(model)
        }
        view.addSubview(self.tableView)
    }
    
}

extension TestViewController : UITableViewDataSource,UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.modelArray[indexPath.row].cellHeigh
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DXTableCell.cellWithTableView(tableView: tableView)
        cell.model = modelArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! DXTableCell
        cell.clickCell()
    }
}

enum DXShowCellTextType {
    case normal
    case expand
}

class DXTableCell: UITableViewCell {
    
    var normalLabel: UILabel!
    var expandLabel: UILabel!
    var superTableView: UITableView!
    var cellType : DXShowCellTextType
    
    static let identify = "cell"
    
    class func cellWithTableView(tableView : UITableView) -> DXTableCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identify) as? DXTableCell
        if cell == nil {
            cell = DXTableCell.init(style: .default, reuseIdentifier: identify)
            cell?.superTableView = tableView
        }
        return cell!
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.cellType = .normal
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setupContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupContentView() {
        normalLabel = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: kScreenW-20, height: 0))
        expandLabel = UILabel.init(frame: CGRect.init(x: 10, y: 10, width: kScreenW-20, height: 0))
        
        normalLabel?.textColor = UIColor.gray
        expandLabel?.textColor = UIColor.black
        
        normalLabel?.font = UIFont.systemFont(ofSize: 14)
        expandLabel?.font = UIFont.systemFont(ofSize: 14)
        
        normalLabel?.numberOfLines = 4
        expandLabel?.numberOfLines = 0
        
        normalLabel?.alpha = 1
        expandLabel?.alpha = 0
        
        self.contentView.addSubview(normalLabel)
        self.contentView.addSubview(expandLabel)
    }
    
    var model : DXCellModel? {
        didSet{
            self.cellType = (model?.cellType)!
            if model?.cellType == .expand {
                normalLabel.alpha = 0
                expandLabel.alpha = 1
                normalLabel.frame = CGRect.init(x: 10, y: 10, width: kScreenW-20, height: 10)
                expandLabel.frame = CGRect.init(x: 10, y: 10, width: kScreenW-20, height: 10)
            }else{
                normalLabel.alpha = 1
                expandLabel.alpha = 0
                normalLabel.frame = CGRect.init(x: 10, y: 10, width: kScreenW-20, height: 10)
                expandLabel.frame = CGRect.init(x: 10, y: 10, width: kScreenW-20, height: 10)
            }
            normalLabel.text = model?.contentStr
            expandLabel.text = model?.contentStr
            
            normalLabel.sizeToFit()
            expandLabel.sizeToFit()
        }
    }
    
    open func clickCell() {
        
        switch cellType {
        case .normal:
            self.cellType = .expand
            self.model?.cellType = .expand
            self.model?.cellHeigh = (self.model?.expandHeigh)!
            cellAnimate(cellType: .normal)
            self.superTableView.beginUpdates()
            self.superTableView.endUpdates()
        case .expand:
            self.cellType = .normal
            self.model?.cellType = .normal
            self.model?.cellHeigh = (self.model?.normalHeigh)!
            cellAnimate(cellType: .expand)
            self.superTableView.beginUpdates()
            self.superTableView.endUpdates()
        default:
            break
        }
    }
    
    func cellAnimate(cellType : DXShowCellTextType){
        if cellType == .normal {
            UIView.animate(withDuration: 0.35, animations: {
                self.expandLabel.alpha = 1
                self.normalLabel.alpha = 0
            })
        }else{
            UIView.animate(withDuration: 0.35, animations: {
                self.expandLabel.alpha = 0
                self.normalLabel.alpha = 1
            })
        }
    }
    
}

public let kScreenW = UIScreen.main.bounds.size.width
public let kScreenH = UIScreen.main.bounds.size.height

class DXCellModel: NSObject {
    
    var contentStr : String?
    var cellHeigh : CGFloat = 0.0
    var normalHeigh : CGFloat = 0.0
    var expandHeigh : CGFloat = 0.0
    var cellType : DXShowCellTextType!
    
    
    init(contentStr : String) {
        
        self.contentStr = contentStr
        self.cellType = DXShowCellTextType.normal
        
        let height1 = DXCellModel.getSpaceLabelHeight(text: contentStr, font: 14, width: kScreenW-20.0)
        let height2 = DXCellModel.getSpaceLabelHeight(text: "one", font: 14, width: kScreenW-20.0)
        self.expandHeigh = height1 + 20.0
        
        let normalTextHeight = height1 >= 4*height2 ? 4*height2 : height1
        self.normalHeigh = normalTextHeight + 20
        self.cellHeigh = self.normalHeigh
    }
    
    //MARK: --计算文字的高度
    fileprivate class func getSpaceLabelHeight(text:String,font:CGFloat,width:CGFloat) -> CGFloat {
       
        let dic = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font*SCALEX)]
        
        let size = text.boundingRect(with: CGSize(width:width,height:CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: dic , context:nil).size
      
        return size.height
    }
    
    
//    //Swift自动计算Label文字决定宽高的封装

//    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
//
//        let statusLabelText: NSString = labelStr
//
//        let size = CGSizeMake(900, height)
//
//        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
//
//        let strSize = statusLabelText.boundingRectWithSize(size, options: .UsesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context:nil).size
//
//        return strSize.width
//
//    }
}
