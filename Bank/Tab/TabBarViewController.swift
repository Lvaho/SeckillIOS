//
//  TabBarViewController.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/8.
//

import SwiftUI


/// 底部控制器
struct TabBarViewController: UIViewControllerRepresentable {
    
    /// 定义为Tabbar类型
    typealias UIViewControllerType = UITabBarController
    
    /// 子控制器
    var childControlls: [UIViewController]
    
    /// 数组
    var tabbarDatas: [TabBarItem]
    
    /// 当前选中的index
    @Binding var selectedIndex: Int
    
    
    /// 创建控制器
    func makeUIViewController(context: UIViewControllerRepresentableContext<TabBarViewController>) -> UITabBarController {
        
        let tabBarViewController = UITabBarController(
        )
        tabBarViewController.viewControllers = childControlls
        
        for (index,item) in childControlls.enumerated() {
            
            /// 读取数据
            let tabdata = tabbarDatas[index]
            
            let tabBarItem = UITabBarItem(title: tabdata.title, image: UIImage(named: tabdata.imgNormal), selectedImage: UIImage(named: tabdata.imgSelect)?.withRenderingMode(.alwaysTemplate))
            
            item.tabBarItem = tabBarItem
        }
        tabBarViewController.selectedIndex = selectedIndex
        tabBarViewController.tabBar.tintColor = .red
        /// 设置代理
        tabBarViewController.delegate = context.coordinator
        return tabBarViewController
        
        
    }
    
    func updateUIViewController(_ uiViewController: UITabBarController, context: UIViewControllerRepresentableContext<TabBarViewController>) {
        
        uiViewController.setViewControllers(childControlls, animated: true)
        
    
        
    }
    
    func makeCoordinator() -> TabBarViewController.Coordinator {
        Coordinator(self)
    }
    
    
    // 协调者
    class Coordinator: NSObject,UITabBarControllerDelegate {
        var parent: TabBarViewController
        init(_ parent: TabBarViewController) {
            self.parent = parent
        }
        
        /// 点击选中的代理
        func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
            parent.selectedIndex = tabBarController.selectedIndex
        }
    }
    

    
    
    
}
