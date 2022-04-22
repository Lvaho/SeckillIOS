//
//  SwiftUI+Extension.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import Foundation
import SwiftUI

extension EdgeInsets {
    
    // 给EdgeInsets添加一个zero的属性
    static var zero: EdgeInsets {
        return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
}

extension Image {
    // 对Image进行的扩展，在之前自定义View的视频中有过介绍
    func resize(size: CGSize, contentModel: ContentMode) -> some View {
        self.resizable()
            .aspectRatio(contentMode: contentModel)
            .frame(width: size.width, height: size.height)
    }
}
