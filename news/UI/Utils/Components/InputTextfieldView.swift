//
//  InputTextfieldView.swift
//  news
//
//  Created by Teguh Satrio on 9/4/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI

struct InputTextfieldView: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        TextField(placeholder, text: $text)
        .frame(maxWidth: .infinity)
        .font(.custom("open-sans.regular", size: 14))
        .foregroundColor(MyColor.grayColors)
        .autocapitalization(.none)
        .keyboardType(keyboardType)
        .padding(.all, 10)
        .background(MyColor.whiteColors)
        .background(
            RoundedRectangle(cornerRadius: 6, style: .continuous)
            .stroke(self.text != "" ? MyColor.orangButtonColors : MyColor.whiteColors, lineWidth: 4)
                
        )
    }
}
