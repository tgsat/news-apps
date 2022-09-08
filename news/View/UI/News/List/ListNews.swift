//
//  ListNews.swift
//  news
//
//  Created by Teguh Satrio on 9/4/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI

struct ListNews: View {
    let menu = Bundle.main.d([ListNewsModels
        ].self, from: "menu.json")
    var body: some View {
        NavigationView(
            List {
                ForEach(menu)
                
            }.navigationBarTitle("Menu")
        )
    }
}

struct ListNews_Previews: PreviewProvider {
    static var previews: some View {
        ListNews()
    }
}
