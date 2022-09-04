//
//  HomeScreen.swift
//  news
//
//  Created by Teguh Satrio on 9/2/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import Foundation
import SwiftUI
import Lottie

struct Homescreen: View {
    @State var showMenu = false
    
    var body: some View {
        let drag = DragGesture()
        .onEnded {
            if $0.translation.width < -100 {
                withAnimation {
                    self.showMenu = false
                }
            }
        }

        return NavigationView {
            GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView(showMenu: self.$showMenu)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width/2 : 0)
                    .disabled(self.showMenu ? true : false)
                if self.showMenu {
                    MenuView()
                    .frame(width: geometry.size.width/2)
                    .transition(.move(edge: .leading))
                }
            }
            .gesture(drag)
        }
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarItems(leading: (
            Button(action: {
                withAnimation {
                    self.showMenu.toggle()
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(MyColor.primaryColors)
            }
        ), trailing: (
            Button(action: {
                print("search")
            }) {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
                    .foregroundColor(MyColor.primaryColors)
            }
        ))
        }
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .center) {
            LottieView(animationName: "404-not-found-page",
            loopMode: .loop,
            contentMode: .scaleAspectFit)
        }.padding(.all, 16)
    }
}
