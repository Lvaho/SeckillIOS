//
//  PageView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct PageViewData: Identifiable{
    let id: String = UUID().uuidString
    let imageNamed: String
}

struct PageView: View {
    let viewData: PageViewData
    
    init(viewData: PageViewData) {
        self.viewData = viewData
    }
    
    var body: some View {
        Image(viewData.imageNamed)
            .resizable()
            .clipped()
            .aspectRatio(contentMode: .fill)
            .frame(width: UIScreen.main.bounds.width - 20, height: 140,alignment: .center)
            .cornerRadius(12)
    }
}
