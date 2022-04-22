//
//  Miaosha.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import Alamofire

struct Miaosha: View {
    @State var goods: [Good] = []
    @State var selected = tabs[0]
    @Namespace var animation
    
    @State var show = false
    @State var selectedItem = items[0]
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    
                    Button(action: {}, label: {
                        Image(systemName: "")
                            .font(.system(size: 25, weight: .heavy))
                            .foregroundColor(.black)
                    })
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {}, label: {
                        Image("headerImg")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 45, height: 45)
                            .cornerRadius(15)
                        
                    })
                }
                .padding(.vertical, 10)
                .padding(.horizontal)
                
                ScrollView(showsIndicators: false){
                    
                    VStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                            })
                            .padding(.horizontal)
                            
                            //Spacer(minLength: 0)
                        }
                        
                        HStack(spacing: 0) {
                         
                            ForEach(tabs, id: \.self) { tab in
                                
                                TabButton(title: tab, selected: $selected, animation: animation)
                                
                                
                                // even spacing
                                if tabs.last != tab {
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                        .padding()
                        .padding(.top, 5)
                        
                        
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 25, content: {
                            
                            ForEach(items) { item in
                                
                                // card View
                                CardView(item: item, animation: animation)
                                    .onTapGesture {
                                        
                                        withAnimation(.spring()) {
                                            
                                            selectedItem = item
                                            show.toggle()
                                        }
                                    }
                            }
                        })
                        .padding()
                    }
                }.frame(height: UIScreen.main.bounds.height-100)
                
                Spacer(minLength: 0)
                
            }
            .opacity(show ? 0 : 1)
            
            if show {
                
                Detail(selectedItem: $selectedItem, show: $show, animation: animation)
            }
        }
        .background(Color.white.ignoresSafeArea())
//        .onAppear {
//            Apis().getPost { (goods) in
//                self.goods = goods
//            }
//        }

    }
}



struct Miaosha_Previews: PreviewProvider {
    static var previews: some View {
        Miaosha()
    }
}

var  tabs = ["定期", "基金", "国债", "债券"]
