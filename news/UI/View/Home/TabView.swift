//
//  TabView.swift
//  news
//
//  Created by Teguh Satrio on 9/2/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI

struct TabView: View {
    
    var body: some View {
        UITabBarWrapper([
            TabBarElement(tabBarElementItem: .init(title: "First", systemImageName: "house.fill")) {
                Text("Second View")
            },
            TabBarElement(tabBarElementItem: .init(title: "Second", systemImageName: "pencil.circle.fill")) {
                Text("Second View")
            },
            TabBarElement(tabBarElementItem: .init(title: "Third", systemImageName: "folder.fill")) {
                Text("Third View")
            },
            TabBarElement(tabBarElementItem: .init(title: "Fourth", systemImageName: "tray.fill")) {
                Text("Fourth View")
            },
        ])
    }
}

struct UITabBarWrapper: View {
    var controllers: [UIHostingController<TabBarElement>] // 1
    
    init(_ elements: [TabBarElement]) {
        self.controllers = elements.enumerated().map { // 2
            let hostingController = UIHostingController(rootView: $1)
            
            hostingController.tabBarItem = UITabBarItem( // 3
                title: $1.tabBarElementItem.title,
                image: UIImage.init(systemName: $1.tabBarElementItem.systemImageName),
                tag: $0 // 4
            )
            
            return hostingController
        }
    }
    
    var body: some View {
        UITabBarControllerWrapper(viewControllers: self.controllers) // 5
    }
}

fileprivate struct UITabBarControllerWrapper: UIViewControllerRepresentable {
    var viewControllers: [UIViewController]
    
    // 2
    func makeUIViewController(context: UIViewControllerRepresentableContext<UITabBarControllerWrapper>) -> UITabBarController {
        let tabBar = UITabBarController()
        
        // Configure Tab Bar here, if needed
        
        return tabBar
    }
    
    // 3
    func updateUIViewController(_ uiViewController: UITabBarController, context: UIViewControllerRepresentableContext<UITabBarControllerWrapper>) {
        uiViewController.setViewControllers(self.viewControllers, animated: true)
    }
    
    // 4
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var parent: UITabBarControllerWrapper
        
        init(_ controller: UITabBarControllerWrapper) {
            self.parent = controller
        }
    }
}

struct TabBarElementItem {
    var title: String
    var systemImageName: String
}

protocol TabBarElementView: View {
    associatedtype Content
    
    var content: Content { get set }
    var tabBarElementItem: TabBarElementItem { get set }
}

struct TabBarElement: TabBarElementView { // 1
    internal var content: AnyView // 2
    
    var tabBarElementItem: TabBarElementItem
    
    init<Content: View>(tabBarElementItem: TabBarElementItem, // 3
         @ViewBuilder _ content: () -> Content) { // 4
        self.tabBarElementItem = tabBarElementItem
        self.content = AnyView(content()) // 5
    }
    
    var body: some View { self.content } // 6
}
