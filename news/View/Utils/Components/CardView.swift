//
//  CardView.swift
//  news
//
//  Created by Teguh Satrio on 9/5/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import Foundation
import SwiftUI

struct CardView: View {
    var img : String
    var show : Bool
    var itemWidth : CGFloat
    var itemHeight : CGFloat
    
    var body : some View{
        
        VStack(alignment: .leading, spacing: 0) {
            
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
        }
        .frame(width: itemWidth, height: show ? itemHeight : itemHeight - 20)
        .cornerRadius(8)
        .shadow(radius: 15)
    }
}
