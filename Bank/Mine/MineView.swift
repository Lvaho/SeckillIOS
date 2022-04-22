//
//  MineView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import SDWebImage

@MainActor
struct MineView: View {
    
    //@EnvironmentObject var initVM: InitViewModel
    
    @State var headerViewMinY: CGFloat = 0
    @State var scrollViewOffsetY: CGFloat = 0
    @State var navViewAlpha: CGFloat = 0
    
    private var mineUserTools: [MineToolModel] = [
        MineToolModel(
            title: "我的交易",
            itemList: [
                MineToolItemModel(title: "基金", icon: "mine_bag", value: 19),
                MineToolItemModel(title: "转账", icon: "mine_saled", value: 3),
                MineToolItemModel(title: "惠享支付", icon: "mine_history", value: 129),
                MineToolItemModel(title: "理财", icon: "mine_taobao", value: nil),
            ]),
        MineToolModel(
            title: "我的会玩",
            itemList: [
                MineToolItemModel(title: "我的圈子", icon: "mine_message", value: nil),
                MineToolItemModel(title: "我的帖子", icon: "mine_blog", value: nil),
                MineToolItemModel(title: "创作者中心", icon: "mine_author_center", value: nil),
                MineToolItemModel(title: "创作学院", icon: "mine_author_school", value: nil),
            ]),
        MineToolModel(
            title: "银行业务办理",
            itemList: [
                MineToolItemModel(title: "外汇兑换", icon: "mine_blog", value: nil),
                MineToolItemModel(title: "快捷支付", icon: "mine_game", value: nil),
                MineToolItemModel(title: "流水打印", icon: "mine_farm", value: nil),
                MineToolItemModel(title: "财富配置", icon: "mine_farm", value: nil)
            ]),
    ]
    
    private var mineSystemTools: [MineToolItemModel] = [
        MineToolItemModel(title: "月度账单", icon: "mine_system_global_doc", value: nil),
        MineToolItemModel(title: "帮助与客服中心", icon: "mine_system_customer_service", value: nil),
        MineToolItemModel(title: "安全中心", icon: "mine_system_safe_content", value: nil),
        MineToolItemModel(title: "红包奖励", icon: "mine_system_coupon", value: nil),
        MineToolItemModel(title: "无卡取现", icon: "mine_system_v", value: nil),
        MineToolItemModel(title: "预留信息", icon: "mine_system_auction", value: nil),
        MineToolItemModel(title: "收支明细", icon: "mine_system_family", value: nil),
        MineToolItemModel(title: "鱼力行动", icon: "mine_system_action", value: nil),
    ]
    
    private func MineHeaderItemView(title: String, num: Int) -> some View {
        VStack(spacing: 5){
            Text("\(num)")
                .fontWeight(.semibold)
            
            Text(title)
                .font(.system(size: 14))
        }
        .frame(maxWidth: .infinity)
    }
    
    private func MineHeaderView() -> some View {
        VStack{
            
            HStack{
//                AsyncImage(url: URL(string: initVM.initModel?.user_info?.avatar ?? "")) { image in
//                    image.resizable()
//                        .clipShape(
//                            Circle()
//                        )
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 60, height: 60)
                                
                Button(action: {}, label: {
                    
                    Image("touxiang")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 80)
                        .cornerRadius(15)
                    
                })
                
//                Image(systemName: "touxiang")
//                    .frame(width: 60, height: 60)
                    //.resizable()
                    //.clipShape(Circle())
                
                VStack(alignment: .leading) {
                    //昵称
                    Text("李小明")
                        .font(.system(size: 25, weight: .semibold))
                    //帐号
                    Text("13812807878")
                        .font(.system(size: 14))
                        .foregroundColor(.black.opacity(0.5))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.black.opacity(0.2))
                
            }
            
            HStack{
                MineHeaderItemView(title: "银行卡", num: 0)
                MineHeaderItemView(title: "优惠券", num: 10)
                MineHeaderItemView(title: "我的豆子", num: 30)
                MineHeaderItemView(title: "待办", num: 5)
            }
            .padding(.vertical, 10)
            
            Divider()
                //.foregroundColor(Color(.orange))
                .foregroundColor(Color(CGColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1.0)))
                .frame(height: 1)
        }

    }
    
    private func MineUserToolListView() -> some View {
        ForEach(mineUserTools) { mineUserSection in
            VStack(alignment: .leading) {
                Text(mineUserSection.title ?? "")
                    .font(.system(size: 20, weight: .semibold))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                
                MineToolSectionView(mineToolItemModels: mineUserSection.itemList ?? [])
            }
        }
    }
    
    private func MineSystemToolListView() -> some View {
        MineToolSectionView(mineToolItemModels: mineSystemTools)
    }
    
    private func MineToolSectionView(mineToolItemModels: [MineToolItemModel]) -> some View {
        
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
            ForEach(mineToolItemModels) { mineToolItemModel in
                VStack {
                    Image(mineToolItemModel.icon!)
                        .resize(size: CGSize(width: 30, height: 30), contentModel: .fit)
                    
                    HStack {
                        Text(mineToolItemModel.title ?? "")
                        if mineToolItemModel.value != nil {
                            Text("\(mineToolItemModel.value!)")
                        }
                    }
                    .font(.system(size: 12))
                }
            }
        }
        
    }
    
    private func MineNavView() -> some View {
        HStack {
            Spacer()
            
//            Text(initVM.initModel?.user_info?.nick_name ?? "")
//                .font(.system(size: 18, weight: .semibold))
//                .foregroundColor(.black.opacity(navViewAlpha))
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "gearshape.circle")
                    .foregroundColor(.black)
            }
        }
        .padding(.horizontal, 16)
        //.padding(.vertical, 5)
        .padding(.top, SCREEN_SAFE_INSETS.top + 5)
        .padding(.bottom, 5)
        .background(Color.white.opacity(navViewAlpha))
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            MineNavView()
                .zIndex(1)
                .offset(y: scrollViewOffsetY)
            
            MineHeaderView()
                .padding(.horizontal, 16)
                .overlay {
                    GeometryReader { proxy -> AnyView in
                        
                        let frame = proxy.frame(in: .global)
                        let minY = frame.minY
                        let height = frame.height
                        
                        DispatchQueue.main.async {
                            if headerViewMinY == 0 {
                                headerViewMinY = minY
                            }
                            
                            scrollViewOffsetY = headerViewMinY - minY
                            navViewAlpha = scrollViewOffsetY / height
                        }
                        
                        return AnyView(
                            Color.clear
                        )
                    }
                }
            
            MineUserToolListView()
            
            Rectangle()
                .fill(Color(CGColor(red: 250/255, green: 249/255, blue: 249/255, alpha: 1.0)))
                .frame(width: 10)
            
            MineSystemToolListView()
            
            MineHeaderView()
                .opacity(0)
            
            Rectangle()
                .fill(Color.white)
                .frame(height: 100 + SCREEN_SAFE_INSETS.top)
                .opacity(0)
        }
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct MineVIew_Previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}


