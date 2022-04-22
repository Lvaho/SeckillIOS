//
//  RegisterViewController.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegisterViewController: UIViewController{
    
    var Image = UIImageView()
    var Identifier = UITextField()
    var Mobile = UITextField()
    var Nickname = UITextField()
    var Password = UITextField()
    var ZCbtn1 = UIButton()
    var FHbtn = UIButton()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        [self .addAllSubViews()]
        
    }
    
    func addAllSubViews() {
        
        Image = UIImageView(frame: CGRect(x: 10, y: 50, width: 20, height: 20))
        Image.image = UIImage(named: "zuojiantou")
        self.view.addSubview(Image)
        
        
        FHbtn = UIButton(type: .system)
        FHbtn = UIButton(frame: CGRect(x: 30, y:40, width: 40, height: 40))
        FHbtn.setTitle("返回", for: UIControl.State.normal)
        
        FHbtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        //FHbtn.layer.cornerRadius = FHbtn.frame.size.width/2
        //FHbtn.center = CGPoint(x: self.view.bounds.width/2, y: 500)
        //FHbtn.backgroundColor = UIColor(red: 74/255, green: 157/255, blue: 255/255, alpha: 1.0)
        self.view.addSubview(FHbtn)
        FHbtn.addTarget(self, action: #selector(clickFH), for: .touchUpInside)
        
        
        
        Identifier = UITextField(frame: CGRect(x: 40, y: 170, width: UIScreen.main.bounds.size.width-80, height: 60))
        Identifier.placeholder = "请输入身份证号码"
        Identifier.textAlignment = .center
        Identifier.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        Identifier.layer.borderWidth = 1
        Identifier.layer.borderColor = UIColor.white.cgColor
        Identifier.layer.cornerRadius = 30
        
        self.view.addSubview(Identifier)
        
        
        Mobile = UITextField(frame: CGRect(x: 40, y: 245, width: UIScreen.main.bounds.size.width-80, height: 60))
        Mobile.placeholder = "请输入手机号"
        Mobile.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        Mobile.textAlignment = .center
        Mobile.layer.borderWidth = 1
        Mobile.layer.borderColor = UIColor.white.cgColor
        Mobile.layer.cornerRadius = 30
        
        self.view.addSubview(Mobile)
        
        Nickname = UITextField(frame: CGRect(x: 40, y: 320, width: UIScreen.main.bounds.size.width-80, height: 60))
        Nickname.placeholder = "请输入姓名"
        Nickname.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        Nickname.textAlignment = .center
        Nickname.layer.borderWidth = 1
        Nickname.layer.borderColor = UIColor.white.cgColor
        Nickname.layer.cornerRadius = 30
        
        self.view.addSubview(Nickname)
        
        Password = UITextField(frame: CGRect(x: 40, y: 395, width: UIScreen.main.bounds.size.width-80, height: 60))
        Password.placeholder = "请输入密码"
        Password.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        Password.textAlignment = .center
        Password.layer.borderWidth = 1
        Password.layer.borderColor = UIColor.white.cgColor
        Password.layer.cornerRadius = 30
        
        self.view.addSubview(Password)
        
        ZCbtn1 = UIButton(type: .system)
        ZCbtn1.frame = CGRect(x: 40, y: 500, width: 80, height: 80)
        ZCbtn1.setTitle("注册", for: UIControl.State.normal)
        ZCbtn1.layer.cornerRadius = ZCbtn1.frame.size.width/2
        ZCbtn1.center = CGPoint(x: self.view.bounds.width/2, y: 500)
        ZCbtn1.backgroundColor = UIColor(red: 74/255, green: 157/255, blue: 255/255, alpha: 1.0)
        self.view.addSubview(ZCbtn1)
        ZCbtn1.addTarget(self, action: #selector(ZCbtnnClick(ZCbtn1:)), for: .touchUpInside)
    }
    
    @objc func clickFH(){
        self.view.window?.rootViewController = LoginViewController()
    }
    
    @objc func ZCbtnnClick(ZCbtn1:UIButton){
        loginValidate1()
    }
    
    @objc func loginValidate1(){
        let a: String = self.Identifier.text!
        let b: String = self.Mobile.text!
        let c: String = self.Nickname.text!
        let d: String = self.Password.text!
        let encrypt:String = HM_SM3 .string(fromOrginString: "12"+d+"c3")
        print("--------------")
        print(a)
        print(b)
        print(c)
        print(d)
        print(encrypt)
        print("--------------")
        var parameters = [
            "identity" : [a],
            "mobile" : [b],
            "nickname" : [c],
            "password" : [d]]
        //let para = ["mobile":"13800000000","password":salts]
        let stringurl = "http://web.keepwork.xyz:8081/user/doRegister?" + "identity="+a+"&"+"mobile="+b+"&"+"nickname="+c+"&"+"password="+encrypt
        Alamofire.request(stringurl,method: .post).responseJSON { (response) in
            if(response.error == nil){
            print("请求成功")
            print(response.result.value!)
                
            }else{
            print("请求失败\(String(describing: response.error))")
            }
            
            let jsonString = response.result.value!
            print(jsonString)
            
            if let value = JSON(jsonString)["obj"].string{
                print(value)
            }
            
            let value = JSON(jsonString)["obj"].string
            let code = JSON(jsonString)["code"].int
            let message = JSON(jsonString)["message"].string!
            
            func showMsgbox(_message: String, _title: String = "提示"){
                    
                let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertController.Style.alert)
                    let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
                    alert.addAction(btnOK)
                    self.present(alert, animated: true, completion: nil)
                    
                }
            
            if (code != 200){
                showMsgbox(_message: message)
            } else {
                self.view.window?.rootViewController = LoginViewController()
            }
        }
        
        
    }
}
