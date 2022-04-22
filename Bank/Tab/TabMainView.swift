//
//  TabMainView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct TabMainView: View {
    var type: TabBarType
    
    init(_ type: TabBarType) {
        self.type = type
    }
    
    var body: some View {

        switch type {
        case .home:
            return AnyView(HomeView())
        case .wealth:
            return AnyView(WealthView())
        case .miaosha:
            return AnyView(Miaosha())
        default:
            return AnyView(MineView())
        }
        
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabMainView(.home)
        }
    }
}
