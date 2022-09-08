//
//  ImageUrl.swift
//  news
//
//  Created by Teguh Satrio on 9/5/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI
import Combine

struct ImageUrl: View {
    var body: some View {
        NetworkImage(url: URL(string: "https://picsum.photos/id/237/300/200")) { image in
          image.resizable().scaledToFill()
        } placeholder: {
          Color.yellow // Shown while the image is loaded or an error occurs
        }
        .frame(width: 150, height: 150)
        .clipped()
    }
}
