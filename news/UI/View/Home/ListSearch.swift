//
//  ListSearch.swift
//  news
//
//  Created by Teguh Satrio on 9/4/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI

struct ListSearch: View {
    @State var searchBar = ""
    
    var body: some View {
        ScrollView(
        .vertical, showsIndicators: false) {
            VStack{
//                HStack {...}
//                    .padding(.horizontal)
                
                TextField("Search", text: $searchBar)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(
                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .stroke(MyColor.whiteColors))

            }
            .padding(.all, 16)
        }.background(MyColor.backgroundColors).edgesIgnoringSafeArea(.all)
    }
}

struct ListSearch_Previews: PreviewProvider {
    static var previews: some View {
        ListSearch()
    }
}
