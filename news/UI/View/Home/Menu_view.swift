//
//  Menu_view.swift
//  news
//
//  Created by Teguh Satrio on 9/2/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct MenuView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "doc.richtext")
                    .foregroundColor(.white)
                    .imageScale(.medium)
                Text(Dictionary.createNews)
                    .foregroundColor(MyColor.backgroundColors)
                    .font(.custom(Dictionary.openSansBold, size: 16))
            }.padding(.top, 100)
            
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.white)
                    .imageScale(.medium)
                Text(Dictionary.profile)
                    .foregroundColor(MyColor.backgroundColors)
                    .font(.custom(Dictionary.openSansBold, size: 16))
            }.padding(.top, 10)
            Spacer()
            
            HStack {
                Button(action: {
                    
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: Dictionary.status)
                    NotificationCenter.default.post(name: NSNotification.Name(Dictionary.status), object: nil)
                    
                }) {

                Image(systemName: "")
                    .foregroundColor(MyColor.backgroundColors)
                    .imageScale(.medium)
                Text(Dictionary.logOut)
                    .foregroundColor(.red)
                    .font(.custom(Dictionary.openSansBold, size: 16))
                }
            }.padding(.bottom, 10)
            
        }
    .padding()
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.init(red: 32/256, green: 32/256, blue: 32/256))
        .edgesIgnoringSafeArea(.all)
    }
}
