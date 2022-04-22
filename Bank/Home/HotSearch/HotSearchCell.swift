//
//  HotSearchCell.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct HotSearchCell: View {
    
    var productname: String
    var detail: String
    var imageName: String
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text("销量榜")
                    .font(.system(size: 13))
                    .foregroundColor(.orange)
                Text(productname)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                Text(detail)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                
            }
            Image(imageName)
            .resizable()
            .frame(width: 70, height: 70)
        }
        
       
    }
}

#if DEBUG
struct HotSearchCell_Previews: PreviewProvider {
    static var previews: some View {
        HotSearchCell(productname: "韩版修身西裤榜", detail: "已下单1000件", imageName: "yanchu")
    }
}
#endif
