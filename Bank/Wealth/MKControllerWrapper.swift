//
//  MKControllerWrapper.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/10.
//

import Foundation
import SwiftUI

struct MKControllerWrapper: UIViewControllerRepresentable {
    typealias UIViewControllerType = MessageViewController

    func makeUIViewController(context: UIViewControllerRepresentableContext<MKControllerWrapper>) -> MKControllerWrapper.UIViewControllerType {

  
      return MessageViewController()

    }

    func updateUIViewController(_ uiViewController: MKControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<MKControllerWrapper>) {
        //
    }
}
