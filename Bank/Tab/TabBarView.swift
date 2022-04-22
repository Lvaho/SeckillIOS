//
//  TabBarView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct TabBarView<T: View>: View {
    /// 自控制器数组
    var viewControllers: [UIHostingController<T>]
    /// 当前选中的索引
    @State var selectedIndex = 0
    
    /// 数组
    var tabbarDatas: [TabBarItem]
    
    
    init(_ views: [T],tabbars: [TabBarItem]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self.tabbarDatas = tabbars
    }
    
    var body: some View {
//        VStack {
//            Text("当前选中的是 ： \(selectedIndex)")
//
            /// 显示Tabbar
            TabBarViewController(childControlls: viewControllers, tabbarDatas: tabbarDatas, selectedIndex: $selectedIndex).edgesIgnoringSafeArea(.all)
//        }

    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView([TabMainView(.home),TabMainView(.wealth),TabMainView(.miaosha),TabMainView(.me)], tabbars: tabBarData)
    }
}
