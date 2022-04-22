//
//  LoginViewController.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import UIKit
import Alamofire
import SwiftyJSON
import GTMWebKit
import WebKit
import SwiftUI

class LoginViewController: UIViewController {

    var AcountNumber = UITextField()
    var PassNumber = UITextField()
    var XYLabel = UILabel()
    var btn = UIButton()
    var SJbtn = UIButton()
    var ZHbtn = UIButton()
    var ZCbtn = UIButton()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        [self .addAllSubViews()]
        
    }
    
    //添加所有的子控件
    func addAllSubViews() {
        //头像
        let headImage = UIImageView(frame: CGRect(x: 100, y: 30, width: 220, height: 100))
        headImage.image = UIImage(named: "")
        self.view.addSubview(headImage)
        //帐号输入框
        AcountNumber = UITextField(frame: CGRect(x: 40, y: 170, width: UIScreen.main.bounds.size.width-80, height: 60))
        AcountNumber.placeholder = "请输入帐号"
        AcountNumber.textAlignment = .center
        AcountNumber.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        AcountNumber.layer.borderWidth = 1
        AcountNumber.layer.borderColor = UIColor.white.cgColor
        AcountNumber.layer.cornerRadius = 30
        AcountNumber.keyboardType = UIKeyboardType.numberPad
        AcountNumber.becomeFirstResponder()
        self.view.addSubview(AcountNumber)
        //self.AountNumber = AountNumber
        //密码输入框
        PassNumber = UITextField(frame: CGRect(x: 40, y: 245, width: UIScreen.main.bounds.size.width-80, height: 60))
        PassNumber.placeholder = "请输入密码"
        PassNumber.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        PassNumber.textAlignment = .center
        PassNumber.layer.borderWidth = 1
        PassNumber.layer.borderColor = UIColor.white.cgColor
        PassNumber.layer.cornerRadius = 30
        PassNumber.keyboardType = UIKeyboardType.numberPad
        PassNumber.becomeFirstResponder()
        self.view.addSubview(PassNumber)
        
        XYLabel = UILabel(frame: CGRect(x: 40, y: 320, width: UIScreen.main.bounds.size.width-80, height: 12))
        XYLabel.text = "已阅读并同意服务协议和隐私保护指引"
        XYLabel.font = UIFont.systemFont(ofSize: 12)
        XYLabel.textAlignment = .center
        self.view.addSubview(XYLabel)
        
        btn = UIButton(type: .system)
        btn.frame = CGRect(x: 40, y: 300, width: 80, height: 80)
        btn.setTitle("登录", for: UIControl.State.normal)
        btn.layer.cornerRadius = btn.frame.size.width/2
        btn.center = CGPoint(x: self.view.bounds.width/2, y: 450)
        btn.backgroundColor = UIColor(red: 74/255, green: 157/255, blue: 255/255, alpha: 1.0)
        self.view.addSubview(btn)
        //btn.addTarget(self, action: #selector(ZCbtnClick(btn:)), for: .touchUpInside)
        btn.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
        //btn.addTarget(self, action: #selector(ZCbtnClick(ZCbtn:)), for: .touchUpInside)
        

        let BJbtn = UIButton(type: .system)
        BJbtn.frame = CGRect(x: 60, y: UIScreen.main.bounds.size.height-80, width: 90, height: 20)
        BJbtn.setTitle("手机号登录", for: UIControl.State.normal)
        BJbtn.setTitleColor(.black, for: UIControl.State.normal)
        self.view.addSubview(BJbtn)
        
        let Label1 = UILabel(frame: CGRect(x: 160, y: UIScreen.main.bounds.size.height-80, width: 10, height: 20))
        Label1.text = "|"
        self.view.addSubview(Label1)
        
        ZHbtn = UIButton(type: .system)
        ZHbtn.frame = CGRect(x: 170, y: UIScreen.main.bounds.size.height-80, width: 90, height: 20)
        ZHbtn.setTitle("找回密码", for: UIControl.State.normal)
        ZHbtn.setTitleColor(.black, for: UIControl.State.normal)
        self.view.addSubview(ZHbtn)
        
        let Label2 = UILabel(frame: CGRect(x: 260, y: UIScreen.main.bounds.size.height-80, width: 10, height: 20))
        Label2.text = "|"
        self.view.addSubview(Label2)
        
        ZCbtn = UIButton(type: .system)
        ZCbtn.frame = CGRect(x: 280, y: UIScreen.main.bounds.size.height-80, width: 90, height: 20)
        ZCbtn.setTitle("新用户注册", for: UIControl.State.normal)
        ZCbtn.setTitleColor(.black, for: UIControl.State.normal)
        self.view.addSubview(ZCbtn)
        //ZCbtn.addTarget(self, action: #selector(ZCbtnClick(ZCbtn:)), for: .touchUpInside)
        ZCbtn.addTarget(self, action: #selector(click1), for: .touchUpInside)
        //ZCbtn.addTarget(self, action: #selector(click2), for: .touchUpInside)
    }
    
    @objc func click1(){
        //self.navigationController?.pushViewController(vc, animated: true)
        self.view.window?.rootViewController = RegisterViewController()
    }
    
    
    @objc func click(_ sender: Any){
        //self.view.window?.rootViewController = MainViewController()
        loginValidate()
        
    }
    
    @objc func loginValidate(){
        var code: String = ""
        let s: String = self.PassNumber.text!
        let encrypt:String = HM_SM3 .string(fromOrginString: "12"+s+"c3")
        print(encrypt)
        print("____________________________")
        print(self.AcountNumber.text)
        let parameters = [
            "mobile" : [self.AcountNumber.text!],
            "password" : [encrypt]]
        //let para = ["mobile":"13800000000","password":salts]
        
        Alamofire.request("http://web.keepwork.xyz:8080/login/doLogin?",method: .post,parameters: parameters,encoding: URLEncoding.queryString).responseJSON { (response) in
            if(response.error == nil){
                print("请求成功")
                print(response.result.value)
                let jsonString = response.result.value!
                print(jsonString)
                if let value = JSON(jsonString)["obj"].string{
                    print(value)
                }
                let value = JSON(jsonString)["obj"].string
                let code = JSON(jsonString)["code"].int
                let message = JSON(jsonString)["message"].string!
                print(code)
                func showMsgbox(_message: String, _title: String = "提示"){
                    let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertController.Style.alert)
                        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
                        alert.addAction(btnOK)
                        self.present(alert, animated: true, completion: nil)
                    }
                if (code != 200){
                    showMsgbox(_message: message)
                } else {
                    let window = UIApplication.shared.windows.first
                    window?.rootViewController = UIHostingController(rootView: TabBarView([TabMainView(.home),TabMainView(.wealth),TabMainView(.miaosha),TabMainView(.me)], tabbars: tabBarData))
                    window?.makeKeyAndVisible()
                }
            }else{
                print("请求失败\(String(describing: response.error))")
            }
    }
        
}
    
}

