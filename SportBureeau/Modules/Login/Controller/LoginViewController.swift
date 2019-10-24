//
//  LoginViewController.swift
//  SportBureeau
//
//  Created by sophiemarceau_qu on 2019/5/10.
//  Copyright © 2019 sophiemarceau_qu. All rights reserved.
//

import UIKit
import SnapKit
class LoginViewController: UIViewController {
    fileprivate lazy var loginVM : LoginVM = LoginVM()
    var sendInt:Int = 60
    private var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录"
        setupUI()
        self.hideKeyboardWhenTappedAround();
    }
    
    func setupUI() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.loginBtn)
        self.view.addSubview(self.phoneBg)
        
        self.phoneBg.addSubview(self.phoneImageView)
        self.phoneBg.addSubview(self.phoneTextField)
        
        self.view.addSubview(self.codeBg)
        self.codeBg.addSubview(self.codeBtn)
        self.codeBg.addSubview(self.codeImageView)
        self.codeBg.addSubview(self.codeTextField)
        
        self.loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBarHeight + 235)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 136), height: 45))
            make.centerX.equalToSuperview()
        }
        
        self.phoneBg.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBarHeight + 157 / 2)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 106), height: 44))
            make.centerX.equalToSuperview()
        }
        
        self.phoneImageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.size.equalTo(CGSize(width: (18), height: 26))
            make.centerY.equalToSuperview()
        }
        
        self.codeBg.snp.makeConstraints { (make) in
            make.top.equalTo(navigationBarHeight + 297 / 2)
            make.size.equalTo(CGSize(width: (SCREEN_WIDTH - 106), height: 44))
            make.centerX.equalToSuperview()
        }
        
        self.codeImageView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.size.equalTo(CGSize(width: (23), height: 26))
            make.centerY.equalToSuperview()
        }
        
        self.codeBtn.snp.makeConstraints { (make) in
            make.top.equalTo(1)
            make.right.equalTo(-1)
            make.size.equalTo(CGSize(width: (72), height: 42))
        }
        
        self.phoneTextField.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 48, bottom: 0, right: 0))
        }
        
        self.codeTextField.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 48, bottom: 0, right: 72))
        }

    }
    
    @objc func requestCode(){
        self.view.endEditing(true)
        let phone = self.phoneTextField.text
        if(!self.isPhoneNumber(phoneNumber: phone!)){
            SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "手机号", body: "请输入正确的手机号", isHiddenBtn: true, seconds: 5)
            self.codeBtn.isEnabled = true
            return
        }
        let parameters: [String : Any] = ["phoneNum":phone!]
        print(parameters)
        loginVM.requestCode(parameters: parameters) {
            if(self.loginVM.codeFlag){
                self.codeBtn.isEnabled = true
                self.startClick()
            }
            self.view.endEditing(true)
        }
    }
    
    @objc func loginOnClick(){
        self.view.endEditing(true)
        self.loginBtn.isEnabled = false
        let phone = self.phoneTextField.text
        if(!self.isPhoneNumber(phoneNumber: phone!)){
            SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "手机号", body: "请输入正确的手机号", isHiddenBtn: true, seconds: 5)
            self.loginBtn.isEnabled = true
            return
        }
        let code = self.codeTextField.text
        if(code?.count == 0){
            SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "验证码", body: "请输入正确的验证码", isHiddenBtn: true, seconds: 5)
            self.loginBtn.isEnabled = true
            return
        }
        
        if(code?.count != 6){
            SwiftMessageManager.showMessage(layoutType: .MessageView, themeType:.Error, iconImageType:.light, presentationStyleType:.top, title: "验证码", body: "请输入4位验证码", isHiddenBtn: true, seconds: 5)
            self.loginBtn.isEnabled = true
            return
        }
        let parameters = [ "captcha": code!,
                           "phoneNum": phone!]
        loginVM.requestData(parameters: parameters) {
            if (User.loginFlag) {
               self.perform(#selector(self.successLogin), with: nil, afterDelay: 1.0)
            }
            self.loginBtn.isEnabled = true
        }
    }
    
    @objc func successLogin(){
        let nc = NotificationCenter.default
        nc.post(name: NSNotification.Name(rawValue: "loginsuccess"), object: nil, userInfo: nil)
    }
    
    func isPhoneNumber(phoneNumber:String) -> Bool {
        if phoneNumber.count == 0 {
            return false
        }
        let mobile = "^(13[0-9]|15[0-9]|18[0-9]|17[0-9]|147)\\d{8}$"
        let regexMobile = NSPredicate(format: "SELF MATCHES %@",mobile)
        if regexMobile.evaluate(with: phoneNumber) == true {
            return true
        }else{
            return false
        }
    }
   
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func startClick() -> Void {
        self.codeBtn.removeFromSuperview()
        self.codeBg.addSubview(self.timeLabel)
        self.timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(1)
            make.right.equalTo(-1)
            make.size.equalTo(CGSize(width: (72), height: 42))
        }
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runClock), userInfo: nil, repeats: true)
        RunLoop.main.add(self.timer, forMode: .common)
        self.timer.fire()
    }
    
    @objc func runClock() -> Void {
        self.timeLabel.text = "\(sendInt)"
        sendInt = sendInt - 1
        if sendInt < 0 {
            self.timer.invalidate()
            self.timeLabel.removeFromSuperview()
            self.codeBg .addSubview(self.codeBtn)
            self.codeBtn.snp.makeConstraints { (make) in
                make.top.equalTo(1)
                make.right.equalTo(-1)
                make.size.equalTo(CGSize(width: (72), height: 42))
            }
            sendInt = 60
        }
    }
    
    func invalidateRetryTime() {
        self.timer .invalidate()
        self.timeLabel.removeFromSuperview()
        self.timer = nil
        sendInt = 60
    }
    
    //Mark: -loginBtn
    private lazy var loginBtn:UIButton = {
        let loginBtn = UIButton.init(type: UIButton.ButtonType.custom)
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.backgroundColor = UIColor(hexString: blueColor)!
        loginBtn.addTarget(self, action: #selector(loginOnClick), for: .touchUpInside)
        loginBtn.layer.cornerRadius = 45 / 2
        return loginBtn
    }()
    
    //Mark: -phoneTextField
    private lazy var phoneTextField:UITextField = {
        let phoneTextField = UITextField.init()
        phoneTextField.placeholder = "请输入手机号码"
        phoneTextField.font = UIFont.systemFont(ofSize: 14.0)
        phoneTextField.keyboardType = UIKeyboardType.numberPad
        return phoneTextField
    }()
    
    private lazy var codeTextField:UITextField = {
        let codeTextField = UITextField.init()
        codeTextField.placeholder = "请输入验证码"
        codeTextField.font = UIFont.systemFont(ofSize: 14.0)
        codeTextField.keyboardType = UIKeyboardType.numberPad
        return codeTextField
    }()
    
    private lazy var phoneBg:UIView = {
        let phoneBg = UIView()
        phoneBg.layer.borderWidth = 1
        phoneBg.layer.borderColor = UIColor(hexString: grayBorderColor)!.cgColor
        return phoneBg
    }()
    
    private lazy var codeBg:UIView = {
        let codeBg = UIView()
        codeBg.layer.borderWidth = 1
        codeBg.layer.borderColor = UIColor(hexString: grayBorderColor)!.cgColor
        return codeBg
    }()
    
    private lazy var phoneImageView:UIImageView = {
        let phoneImageView = UIImageView()
        phoneImageView.image = UIImage(named: "231557322683_.pic")
        return phoneImageView
    }()
    
    private lazy var codeImageView:UIImageView = {
        let codeImageView = UIImageView()
        codeImageView.image = UIImage(named: "221557322680_.pic")
        return codeImageView
    }()
    
    private lazy var codeBtn:UIButton = {
        let codeBtn = UIButton.init(type: UIButton.ButtonType.custom)
        codeBtn.backgroundColor = UIColor(hexString: blueColor)!
        codeBtn.setTitle("获取验证码", for: .normal)
        codeBtn.titleLabel?.font = UIFont.systemFont(ofSize: 11.0)
        codeBtn.setTitleColor(UIColor.white, for: .normal)
        codeBtn.addTarget(self, action: #selector(requestCode), for: .touchUpInside)
        return codeBtn
    }()
    
    private lazy var timeLabel:UILabel = {
        let timeLabel = UILabel.init()
        timeLabel.backgroundColor = UIColor(hexString: blueColor)!
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.systemFont(ofSize: 11.0)
        return timeLabel
    }()
}
