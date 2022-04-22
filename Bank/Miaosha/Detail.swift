//
//  Detail.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct Detail: View {
    
    @State private var s: String = ""
    @State private var ts = true
    
    @State private var isActive = true
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var obj: String = ""
    @State private var messages: String = ""
    @State private var showingAlert = false
    
    @Binding var selectedItem: Item
    @Binding var show: Bool
    
    @State var loadContent = false
    
    @State var selectedColor : Color = Color("p2")
    var animation: Namespace.ID
    
    var body: some View {
        
            VStack {
                
                HStack(spacing: 25) {
                    
                    Button(action: {
                        //close view
                        withAnimation(.spring()) {
                            show.toggle()
                        }
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "magnifyingglass")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        Image(systemName: "bag")
                            .font(.title)
                            .foregroundColor(.black)
                    })
                }
                .padding()
                
                
                VStack(spacing: 10) {
                    
                    Image(selectedItem.s)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        // since  id is conmon
                        .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                        .padding()
                    
                    Text(selectedItem.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .matchedGeometryEffect(id: "title\(selectedItem.id)", in: animation)
                    
                    Text(selectedItem.subTitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .matchedGeometryEffect(id: "subTitle\(selectedItem.id)", in: animation)
                    
                    
                    HStack {
                        
                        Text("库存 "+selectedItem.rating)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                            .matchedGeometryEffect(id: "rating\(selectedItem.id)", in: animation)
                        
                       
                        Spacer(minLength: 0)
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "suit.heart")
                                .font(.title2)
                                .foregroundColor(.black)
                                .matchedGeometryEffect(id: "heart\(selectedItem.id)", in: animation)
                        })
                        
                        
                    }
                    .padding(.horizontal)
                    .padding(.top, 5)
                    .padding(.bottom, 10)
                }
                .padding(.top, 35)
                .background(
                    Color(selectedItem.image)
                        .clipShape(CustomShape())
                        .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
                )
                .cornerRadius(10)
                .padding()
                
                // delay laoding the content for smooth animation...
                
                VStack {
                    
                    VStack {
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("详情(Detail)")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            //Text("Frame + lens for \(selectedItem.price)(it's 50% off)")
                            Text("本结构性存款产品是保本浮动收益结构性存款产品，期限15天，在满足一定条件下，投资者可获得1.85%的净年化收益；在最差的市场情况下，投资者可获得0.30%的净年化收益。(具体收益结构见产品说明部分“产品收益说明”)")
                                .foregroundColor(.gray)
                            
                            Text("秒杀时间")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                            
                            Text("2022.01.21 00:00:16--2022.04.23 23:00:28")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 30, alignment: .leading)
                    .background(Color("p3"))
                    .cornerRadius(15)
                    
                    
//                    VStack(alignment: .leading, spacing: 10, content: {
//
//                        Text("Color")
//                            .fontWeight(.heavy)
//                            .foregroundColor(.black)
//
//                        HStack (spacing: 15){
//
//                            ForEach(1...4, id: \.self) { index in
//
//                                ZStack {
//
//                                    Color("p\(index + 1)")
//                                        .clipShape(Circle())
//                                        .frame(width: 45, height: 45)
//                                        .onTapGesture {
//
//                                            withAnimation(.spring()) {
//                                                selectedColor = Color("p\(index + 1)")
//                                            }
//                                        }
//
//                                    if selectedColor == Color("p\(index + 1)") {
//
//                                        Image(systemName: "checkmark")
//                                            .foregroundColor(.black)
//                                    }
//                                }
//                            }
//
//                            Spacer(minLength: 0)
//                        }
//
//
//                    })
//                    .padding()
                    
                    
                }
                .padding([.horizontal, .bottom])
                .frame(height: loadContent ? nil : 0)
                .opacity(loadContent ? 1 : 0)
                
                Spacer(minLength: 15)
                
                Button(action: {
                    Alamofire.request("http://web.keepwork.xyz:8080/seckill/path?goodsId="+selectedItem.number,method: .get,parameters: nil,encoding: URLEncoding.queryString).responseJSON { (response) in
                        let jsonString = response.result.value!
                        print(jsonString)
                        let value = JSON(jsonString)["obj"].string!
                        print(value)
                        Alamofire.request("http://web.keepwork.xyz:8080/seckill/"+value+"/doSeckill?goodsId="+selectedItem.number,method: .post,parameters: nil,encoding: URLEncoding.queryString).responseJSON { (response) in
                            print(response.result.value!)
                            let jsonString = response.result.value!
                            var code = JSON(jsonString)["code"].int
                            let message = JSON(jsonString)["message"].string!
                            self.showingAlert = true
                            self.messages = message
                        }

                    }
                    
                }, label: {
                
                    Text("立刻秒杀")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(

                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                }).alert(isPresented: $showingAlert) {
                    
                    
                    Alert(title: Text("秒杀结果"),
                          message: Text("\(messages)"),
                          dismissButton: .default(Text("OK")))
                    
                }
//                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
//                    self.isActive = false
//                }
//                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
//                    self.isActive = true
//                }
//                .onReceive(timer) { time in
//                    guard self.isActive else { return }
//                    if self.timeRemaining > 0 {
//                        self.timeRemaining -= 1
//                    }
//                }
                
                
                Button(action:{
                    goToSee()
                }, label: {

                    Text("查询结果")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                        .background(
                            Color.black
                        )
                        .cornerRadius(15)

                })
                .padding(.vertical)
                
                
                Spacer(minLength: 0)
            }
            .frame(height: UIScreen.main.bounds.height-130)
            .onAppear {
                
                withAnimation(Animation.spring().delay(0.45)) {
                    loadContent.toggle()
                }
            }

    }
    
        
    
}

func goToSee() {
    if let window = UIApplication.shared.windows.first
    {
        window.rootViewController = UIHostingController(rootView: Z())
        window.makeKeyAndVisible()
    }
    
}


