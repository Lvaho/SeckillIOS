//
//  Z.swift
//  黑马微博
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import Alamofire
import WebKit
import SwiftyJSON

struct Z: View {
    
    @State private var messages: String = ""
    @State private var orderId: Int = 0
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .center,spacing: 20){
                    HStack{
                        Spacer()
                    }.frame(height: 30)
                    HStack(spacing: 20){
                        Spacer()
                            .frame(width: 0)
                        Button(action: {
                            goTosSeess()
                        }, label: {
                            
                            Image(systemName: "chevron.left")
                                .font(.title)
                                .foregroundColor(.black)
                            Text("返回")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .font(.title2)
                        })
                    
                        Spacer()
                    }
                
                    HStack(alignment: .top){
                        
                        VStack(alignment: .leading,spacing: 10){
            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("联系人：")
                                    .font(.system(size: 20))
                                    .bold()
                                Spacer()
                                Text("李小明")
                                Spacer()
                                    .frame(width: 0)
                            }
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("联系人帐号：")
                                Spacer()
                                Text("13812807878")
                                Spacer()
                                    .frame(width: 0)
                            }
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("订单备注：")
                                Spacer()
                                
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width-10, height: 150, alignment: .center)
                        .cornerRadius(15)
                        .background(.white)
                    
                    HStack(alignment: .center){
                        
                        VStack(alignment: .leading,spacing: 10){
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("详细信息")
                                    .font(.system(size: 20))
                                    .bold()
                                Spacer()
                            }
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("产品名称：")
                                Spacer()
                            }
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("产品数量：")
                                Spacer()
                                Button(action: {}, label: {
                                    Text("1")
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                })
                                Spacer()
                                    .frame(width: 0)
                            }
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("优惠政策：")
                                Spacer()
                                Button(action: {}, label: {
                                    Text("秒杀产品")
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                })
                                Spacer()
                                    .frame(width: 0)
                            }
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("订单备注：")
                                Spacer()
                                Button(action: {}, label: {
                                    Text("无备注")
                                        .foregroundColor(.gray)
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                })
                                Spacer()
                                    .frame(width: 0)
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width-10, height: 200, alignment: .center)
                        .cornerRadius(15)
                        .background(.white)
                
                    ZStack(alignment: .center){
                        HStack(alignment: .center){
                            
                            VStack(alignment: .leading,spacing: 10){
                                
                                
                                
                                HStack(spacing: 20){
                                    Spacer()
                                        .frame(width: 0)
                                    Text("价格明细")
                                        .font(.system(size: 20))
                                        .bold()
                                    Spacer()
                                }
                                HStack(spacing: 20){
                                    Spacer()
                                        .frame(width: 0)
                                    Text("商品总价")
                                    Text("共1份产品")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text("¥1249")
                                    Spacer()
                                        .frame(width: 0)
                                }
                                
                                HStack(spacing: 20){
                                    Spacer()
                                        .frame(width: 0)
                                    Text("App优惠")
                                    Text("秒杀特价产品")
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Button(action: {}, label: {
                                        Text("减¥620")
                                            .foregroundColor(.orange)
                                            .font(.title3)
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                    })
                                    Spacer()
                                        .frame(width: 0)
                                }
                                
                                HStack(spacing: 20){
                                    Spacer()
                                        .frame(width: 0)
                                    Text("合计")
                                    Spacer()
                                    Text("¥629")
                                    Spacer()
                                        .frame(width: 0)
                                }
                            }
                        }.frame(width: UIScreen.main.bounds.width-10, height: 150, alignment: .center)
                            .cornerRadius(15)
                            .background(.white)
                    }
                
                    HStack(alignment: .center){
                        
                        VStack(alignment: .leading,spacing: 10){
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Text("支付方式：")
                                Spacer()
                            }
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Image("yue")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                
                                Text("余额支付")
                                Spacer()
                                Image("31xuanzhong")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Spacer()
                                    .frame(width: 0)
                            }
                            
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Image("zfb")
                                    .resizable()
                                    //.renderingMode(.template)
                                    //.aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                    //.padding(.vertical,12)
                                    //.padding(.horizontal, 30)
                                    //.clipShape(Capsule())
                                Text("支付宝支付")
                                Spacer()
                                Image("weixuan")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Spacer()
                                    .frame(width: 0)
                            }
                            HStack(spacing: 20){
                                Spacer()
                                    .frame(width: 0)
                                Image("wx2")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text("微信支付")
                                Spacer()
                                Image("weixuan")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Spacer()
                                    .frame(width: 0)
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width-10, height: 180, alignment: .center)
                        .cornerRadius(15)
                        .background(.white)
                
                    HStack{
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
                            
                            Text("立即支付")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 200)
                                .background(
                                    Color.orange
                                )
                                .cornerRadius(15)
                        }).alert(isPresented: $showingAlert) {
                            
                            
                            Alert(title: Text("支付结果"),
                                  message: Text("\(messages)"),
                                  dismissButton: .default(Text("OK")))
                            
                        }
                            
                    }.frame(width: UIScreen.main.bounds.width, height: 50)
                
                    HStack{
                        Spacer()
                    }.frame(height: 10)
                
            }.background(Color(CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)).ignoresSafeArea(.all))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-100 , alignment: .leading)
                .padding(0)
        }
    }
}

struct Z_Previews: PreviewProvider {
    static var previews: some View {
        Z()
    }
}

func goTosSeess() {
    if let window = UIApplication.shared.windows.first
    {
        window.rootViewController = UIHostingController(rootView: TabBarView([TabMainView(.home),TabMainView(.wealth),TabMainView(.miaosha),TabMainView(.me)], tabbars: tabBarData))
        window.makeKeyAndVisible()
    }
}



