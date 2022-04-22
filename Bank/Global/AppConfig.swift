//
//  AppConfig.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import UIKit

let SCREEN_WIDTH: CGFloat = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT: CGFloat = UIScreen.main.bounds.size.height
let SCREEN_SAFE_INSETS: UIEdgeInsets = UIApplication.shared.windows.first?.safeAreaInsets ?? .zero
let SCREEN_TAB_HEIGHT: CGFloat = UIApplication.shared.windows.first?.rootViewController?.tabBarController?.tabBar.bounds.height ?? 0
