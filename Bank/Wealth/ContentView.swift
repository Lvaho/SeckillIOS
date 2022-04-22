//
//  ContentView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/10.
//

import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        NavigationView{
            WebView(url: URL(string: "http://web.keepwork.xyz:8080/deposit/toDeposit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
