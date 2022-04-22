//
//  Message.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct Message: View {
    
    @State private var orderId: Int = 0
    @State private var showingAlert = false
    @State private var messages: String = ""
    
    var body: some View {
        VStack(spacing:0){
            HStack{
                Button(action: {
                    goTosSees()
                }, label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.black)
                })
                
                Button(action: {
                    Alamofire.request("http://web.keepwork.xyz:8080/seckill/result?goodsId=1",method: .get,parameters: nil,encoding: URLEncoding.queryString).responseJSON { (response) in
                        let jsonString = response.result.value!
                        print(jsonString)
                        let value = JSON(jsonString)["obj"].int!
                        self.orderId = value
                        Alamofire.request("http://web.keepwork.xyz:8080/order/payorder?orderId=\(orderId)",method: .post,parameters: nil,encoding: URLEncoding.queryString).responseJSON { (response) in
                            let jsonString = response.result.value!
                            let message = JSON(jsonString)["message"].string!
                            self.messages = message
                            self.showingAlert = true
                        
                        }
                    }
                }, label: {
                    
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.red)
                }).alert(isPresented: $showingAlert) {
                    
                    
                    Alert(title: Text("秒杀结果"),
                          message: Text("\(messages)"),
                          dismissButton: .default(Text("OK")))
                    
                }
                    
            }.offset(x: 0, y: 0)
                .padding(.leading)
            
            HStack{
               Text("产品名称：")
            }.frame(width: 100, height: 50, alignment: .center)
                .cornerRadius(12)
            
            
        }.background(Color(CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}


func goTosSees() {
    if let window = UIApplication.shared.windows.first
    {
        window.rootViewController = UIHostingController(rootView: TabBarView([TabMainView(.home),TabMainView(.wealth),TabMainView(.miaosha),TabMainView(.me)], tabbars: tabBarData))
        window.makeKeyAndVisible()
    }
}
