//
//  CustomButton.swift
//  news
//
//  Created by Teguh Satrio on 9/5/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    @Binding var text: String
    @Binding var verify: Bool
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        Button(action: {
            
            self.verify = false
            
        }) {
            
            Text(Dictionary.login)
            .tracking(2)
                .font(.custom("open-sans.bold", size: 18))
                .fontWeight(.bold)
                .foregroundColor(MyColor.whiteColors)
                .padding(.all, 14)
                .frame(maxWidth: .infinity)
                
        }
        .background(MyColor.orangButtonColors)
        .cornerRadius(6)
    }
}
