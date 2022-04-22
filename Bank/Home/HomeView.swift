//
//  HomeView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct HomeView: View {
    
    let pages: [PageViewData] = [
        PageViewData(imageNamed: "post1"),
        PageViewData(imageNamed: "post2"),
        PageViewData(imageNamed: "post3"),
        PageViewData(imageNamed: "post4"),
        PageViewData(imageNamed: "post5")
        
    ]
    @State private var index: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var selectedIndex = 0
    
    @State var currentIndex: Int = 0
    
    @State var posts: [Post] = []
    
    @State var currentTab = "Slide Show"
    
    @Namespace var animation
    
    var body: some View {
        NavigationView{
            VStack(spacing:0){
                HStack{
                    Color.orange
                        .ignoresSafeArea()
                        .frame(width: UIScreen.main.bounds.width, height: 30)
                }.navigationBarItems(leading: searchBar, trailing: postButton)
                    .navigationBarTitle(Text(""),displayMode: .inline)
                    .navigationTitle("")
                
                gongneng
            }
        }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
}
     
    private var searchBar : some View {
        HStack(spacing: 4){
            Text("北京")
                .foregroundColor(.white)
                .offset(x: 0, y: 20)
            Image(systemName: "plus")
                .font(.title3)
                .foregroundColor(.white)
                .offset(x: 8, y: 20)

            ZStack{

                Capsule()
                    .fill(Color.white)

                HStack{
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 14))
                    Text("社保缴费")
                        .font(.system(size: 13))
                        .lineLimit(1)
                    Spacer()
                }.padding(.leading, 12)
            }.offset(x: 15, y: 20)
            .frame(width: UIScreen.main.bounds.width - 180, height: 36)
            
//            Image(systemName: "plus")
//                .font(.title3)
//                .foregroundColor(.white)
//                .offset(x: UIScreen.main.bounds.width - 80, y: 20)
        }
//
    }
    
    private var postButton : some View {
        VStack(spacing: 4){
            Image(systemName: "person.fill")
                .font(.title3)
        }.foregroundColor(.white)
            .offset(x: UIScreen.main.bounds.width - 20, y: 20)
    }
}

extension HomeView {
    private var gongneng : some View{
        ScrollView(showsIndicators: false) {
            VStack{
                HStack(spacing: 0){
                    VStack{
                        Button(action: {}, label:{
                            Image("wealth")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                .padding(.horizontal, 30)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        })
                        .padding(.top)
                        Text("  我的财富")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                    }.frame(width: UIScreen.main.bounds.width / 4)

                    VStack{
                        Button(action: {}, label:{
                            Image("zhuanzhang")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                .padding(.horizontal, 35)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        })
                        .padding(.top)
                        Text("我要转账")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                    }.frame(width: UIScreen.main.bounds.width / 4)

                    VStack{
                        Button(action: {}, label:{
                            Image("saoyisao")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                .padding(.horizontal, 30)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        })
                        .padding(.top)
                        Text("扫一扫")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                    }.frame(width: UIScreen.main.bounds.width / 4)

                    VStack{
                        Button(action: {}, label:{
                            Image("wodejiekuan")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                .padding(.horizontal, 30)
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                        })
                        .padding(.top)
                        Text("我要借款  ")
                            .foregroundColor(.white)
                            .font(.system(size: 15))

                    }.frame(width: UIScreen.main.bounds.width / 4,height: 120)

                }.background(Color.orange)
                    .frame(width: UIScreen.main.bounds.width)
                //Color.init(red: 1.0, green: 140/255, blue: 0)


                HStack(spacing:40){

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("caifu-2")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("理财")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("xinyongqia")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("信用卡")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("weibiaoti5")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("直接贷")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("jijin")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("基金")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("youhuiquan")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("优惠")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                }.frame(width: UIScreen.main.bounds.width)

                HStack(spacing:40){
                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("shenqing")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("申请")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("waimai")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("点外卖")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("fuli")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("福利社")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("shangcheng")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("商城")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)

                    VStack(spacing:0){
                        Button(action: {}, label:{
                            Image("quanbu")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.top)
                        Text("全部")
                            .foregroundColor(.black)
                            .font(.system(size: 14))

                    }//.frame(width: UIScreen.main.bounds.width / 5)



                }.frame(width: UIScreen.main.bounds.width, height: 100)


                ZStack{

                    Capsule()
                        .fill(Color.white)

                    HStack{
//                        Image(systemName: "magnifyingglass")
//                            .font(.system(size: 14))
                        Text("公告")
                            .foregroundColor(.blue)
                        Text("社保缴费")
                            .font(.system(size: 13))
                            .lineLimit(1)
                        Spacer()
                        Button(action: {}, label:{
                            Image("arrow")
                                .resizable()
                                .frame(width: 20, height: 5)
                                .padding(.vertical,12)
                                .padding(.horizontal, 10)
                                .foregroundColor(.white)
                            Text("更多")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.trailing)
                        }).cornerRadius(10)
                    }.padding(.leading, 12)
                }.frame(width: UIScreen.main.bounds.width-25, height: 36)

                VStack(spacing: 15){

                    HStack(alignment: .center, spacing: 10){
//                        SnapCarousel(index: $currentIndex, items: posts){ post in
//
//                            GeometryReader{ proxy in
//
//                                let size = proxy.size
//
//                                Image(post.postImage)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: UIScreen.main.bounds.width - 20, height: 140,alignment: .center)
//                                    .cornerRadius(12)
//                            }
//                        }
//                        .padding(.vertical)
                        SwiperView(pages: self.pages, index: self.$index)
                            .frame(height:300)
                            .padding(.vertical)
                    }
                    .onReceive(timer) { time in
                        
                        self.index = (self.index+10) % 5
                        
                    }

//                    HStack(spacing: 10){
//                        ForEach(posts.indices, id: \.self){ index in
//                            Circle()
//                                .fill(Color.black.opacity(currentIndex == index ? 1 : 0.1))
//                                .frame(width: 10, height: 10)
//                                .scaleEffect(currentIndex == index ? 1.4 : 1)
//                                .animation(.spring(), value: currentIndex == index)
//                        }
//                    }
//                    .padding(.bottom,0)
                }
                .frame(width: UIScreen.main.bounds.width-20, height: 150, alignment: .leading)
                .onAppear {
                    for index in 1...5{
                        posts.append(Post(postImage: "post\(index)"))
                    }
                }

                ZStack(alignment: .leading){
                    HStack(spacing: 10){
                        Text("精品抢购")
                            .font(.system(size: 20))
                            .bold()
                            .padding(.leading)
                        Text(" 超值购买")
                            .font(.system(size:16))
                        Spacer()
                        Text("更多")
                            .foregroundColor(.gray)
                            .font(.system(size:16))

                        Button(action: {}, label:{
                            Image("jiantou")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .padding(.vertical,12)
                                //.padding(.horizontal, 1)
                                .clipShape(Capsule())
                                .foregroundColor(.black)
                        })
                        .padding(.trailing)

                    }

                }
                
                VStack{
                    
                    /// 限时抢购
                    FlashSaleView().padding(.top,-20)
                    
                    ZStack(alignment: .leading){
                        Spacer()
                        HStack(spacing: 10){
                            Text("会员特惠")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading)
                            Text(" 专属福利")
                                .font(.system(size:16))
                            Spacer()
                            Text("更多")
                                .font(.system(size:16))
                                .foregroundColor(.gray)

                            Button(action: {}, label:{
                                Image("jiantou")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .padding(.vertical,12)
                                    //.padding(.horizontal, 1)
                                    .clipShape(Capsule())
                                    .foregroundColor(.black)
                            })
                            .padding(.trailing)

                        }

                    }


                    /// 热搜榜
                    HotSearchView()

                    
                    ZStack(alignment: .leading){
                        HStack(spacing: 10){
                            Text("主题精选")
                                .font(.system(size: 20))
                                .bold()
                                .padding(.leading)
                            Text(" 个人定制")
                                .font(.system(size:16))
                            Spacer()
                            Text("更多")
                                .font(.system(size:16))
                                .foregroundColor(.gray)

                            Button(action: {}, label:{
                                Image("jiantou")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                    .padding(.vertical,12)
                                    //.padding(.horizontal, 1)
                                    .clipShape(Capsule())
                                    .foregroundColor(.black)
                            })
                            .padding(.trailing)

                        }

                    }
                    
                    /// 主题精选
                    ThemeChoiceView()
                    Spacer()
                }
            }

        }.background(Color(CGColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)))
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
