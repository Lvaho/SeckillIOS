//
//  Week.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI

struct Week: Identifiable {
    var id = UUID().uuidString
    var day: String
    var date: String
    var amountSpent: CGFloat
}
