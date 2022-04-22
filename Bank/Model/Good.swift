//
//  Good.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import Alamofire
struct Good: Identifiable,Codable{
    var endDate: Int
    var goodsDetail: String
    var goodsImg: String
    var goodsName: String
    var goodsPrice: Int
    var goodsStock: Int
    var goodsTitle: String
    var id: Int
    var seckillPrice: Int
    var startDate: Int
    var stockCount: Int
    
}
