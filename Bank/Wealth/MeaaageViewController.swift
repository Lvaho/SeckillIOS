//
//  MeaaageViewController.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/10.
//

import UIKit
import SwiftUI
import GTMWebKit
import WebKit
import Alamofire

class MessageViewController: UIViewController {
    
    
    var btn = UIButton()
    @IBOutlet weak var webContainerView: UIView!
    
    var url = "http://web.keepwork.xyz:8080/deposit/toDeposit"
    var webView :WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URL(string: url)!
        let webrequest = URLRequest(url: request)
        let UIWeb = UIWebView.init(frame: self.view.bounds)
        UIWeb.loadRequest(webrequest)
        self.view.addSubview(UIWeb)
        [self .add()]
    }
    
    func add(){
        btn = UIButton(type: .system)
        btn.frame = CGRect(x: 40, y: 300, width: 80, height: 80)
        btn.setTitle("返回", for: UIControl.State.normal)
        btn.layer.cornerRadius = btn.frame.size.width/2
        btn.center = CGPoint(x: self.view.bounds.width/2, y: 450)
        btn.backgroundColor = UIColor(red: 74/255, green: 157/255, blue: 255/255, alpha: 1.0)
        self.view.addSubview(btn)
        //btn.addTarget(self, action: #selector(ZCbtnClick(btn:)), for: .touchUpInside)
        btn.addTarget(self, action: #selector(click(_:)), for: .touchUpInside)
    }
    
    @objc func click(_ sender: Any){
        
        if let window = UIApplication.shared.windows.first
        {
            window.rootViewController = UIHostingController(rootView: TabBarView([TabMainView(.home),TabMainView(.wealth),TabMainView(.miaosha),TabMainView(.me)], tabbars: tabBarData))
            window.makeKeyAndVisible()
        }
        
    }
    
}
