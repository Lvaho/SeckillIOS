//
//  FlashSaleView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct FlashSaleView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Image("flashsalebg")
                .resizable()
                .frame(height: 420)
            
            VStack(alignment: .center, spacing: 5) {
                HStack {
                    
                    FlashSaleCellView(title: "限时抢购", leftImage: "08", rightImage: "07", lefttxt: "爆款直降", rigghttxt: "限时特价", txtColor: Color.red)
                    FlashSaleCellView(title: "便宜好物", leftImage: "06", rightImage: "05", lefttxt: "好货必买", rigghttxt: "好货必买", txtColor: Color.orange)
                }
                HStack {
                    
                    FlashSaleCellView(title: "聚划算", leftImage: "04", rightImage: "03", lefttxt: "抢100元券", rigghttxt: "抢50元券", txtColor: Color.red)
                    FlashSaleCellView(title: "天猫闪降", leftImage: "02", rightImage: "01", lefttxt: "已降30元", rigghttxt: "已降31元", txtColor: Color.red)
                }
                FlashSaleBottomCell().padding(.top,5)
            }

        }
        .background(Color.clear)

    }
}

#if DEBUG
struct FlashSaleView_Previews: PreviewProvider {
    static var previews: some View {
        FlashSaleView()
    }
}
#endif
