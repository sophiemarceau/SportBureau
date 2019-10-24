//
//  OpenDoorTableViewCell.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/26.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit

class OpenDoorTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
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
        contentView.addSubview(bgImageView)
        bgImageView.addSubview(doorTitleLabel)
        bgImageView.addSubview(openButton)
        openButton.addSubview(keyImageView)

        bgImageView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(5)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH - 10, height: 71))
        }

        doorTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(25)
            make.left.equalTo(20)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 20) / 2 + 50, height: 20))
        }

        openButton.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.size.equalTo(CGSize(width: 98, height: 50))
        }

        keyImageView.snp.makeConstraints { make in
            make.top.equalTo(19)
            make.left.equalTo(35)
            make.size.equalTo(CGSize(width: 27, height: 12))
        }
    }

    private lazy var bgImageView: UIImageView = {
        let bgImageView = UIImageView()
        bgImageView.image = UIImage(named: "opendoorBGIcon")
        return bgImageView
    }()

    private lazy var doorTitleLabel: UILabel = {
        let doorTitleLabel = UILabel()
        doorTitleLabel.textColor = UIColor(hexString: "#6f6f6f")!
        doorTitleLabel.text = "北1门"
        doorTitleLabel.textAlignment = NSTextAlignment.left
        doorTitleLabel.font = UIFont.systemFont(ofSize: 20)
        return doorTitleLabel
    }()

    private lazy var keyImageView: UIImageView = {
        let keyImageView = UIImageView()
        keyImageView.image = UIImage(named: "keyIcon")
        return keyImageView
    }()

    private lazy var openButton: UIButton = {
        let openButton = UIButton(type: .custom)
        openButton.setBackgroundImage(UIImage(named: "openBtnIcon"), for: .normal)
        return openButton
    }()

    func configUI(dataItem: OpenDoorItem?) {
        if let dataItem = dataItem {
            print("configUI\(dataItem)")
            doorTitleLabel.text = dataItem.doorName
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
