//
//  Item.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI
import Alamofire

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var price: String
    var rating: String
    var image: String
    var number: String
    var s: String
    
}

var items = [
    Item(title: "汇利丰结构性存款", subTitle: "2022年第0067期", price: "$629", rating: "114", image: "p1",number: "1",s: "s1"),
    Item(title: "汇利丰结构性存款", subTitle: "2022年第0066期", price: "$629", rating: "107", image: "p2",number: "2",s: "s1"),
    Item(title: "汇利丰结构性存款", subTitle: "2022年第0065期", price: "$629", rating: "107", image: "p3",number: "3",s: "s1"),
    Item(title: "汇利丰结构性存款", subTitle: "2022年第0064期", price: "$629", rating: "108", image: "p4",number: "4",s: "s1"),
    Item(title: "汇利丰结构性存款", subTitle: "2022年第0063期", price: "$629", rating: "108", image: "p4",number: "5",s: "s1"),
    Item(title: "汇利丰结构性存款", subTitle: "2022年第0062期", price: "$629", rating: "108", image: "p4",number: "6",s: "s1"),
    //Item(title: "Vu Abstact", subTitle: "Fashion U", price: "$23", rating: "5.3", image: "p4",number: 7)
]
