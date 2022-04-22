//
//  MineToolModel.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import Foundation

struct MineToolModel: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var title: String?
    var itemList: [MineToolItemModel]?
}

struct MineToolItemModel: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    var title: String?
    var icon: String?
    var value: Int?
}
