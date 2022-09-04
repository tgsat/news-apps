//
//  RegisterScreen.swift
//  news
//
//  Created by Teguh Satrio on 9/2/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct RegisterScreen: View {
    
    @State var color = MyColor.whiteColors
    @State var colorBold = MyColor.articleColors
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        
        ZStack{
            
            ZStack(alignment: .topLeading) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        HStack {
                        Text(Dictionary.signUp)
                            .font(.custom("SFPRODISPLAYBOLD", size: 34))
                            .fontWeight(.semibold)
                            .foregroundColor(MyColor.boldHeader)
                            .padding(.top, 30)
                        Spacer()
                        }
                        
                        HStack {
                            Text(Dictionary.enterName)
                            .font(.custom("SFPRODISPLAYREGULAR", size: 18))
                            .fontWeight(.regular) .foregroundColor(MyColor.grayColors)
                                .lineLimit(2)
                        Spacer()
                        }

                        InputTextfieldView(
                        text: self.$email,
                        placeholder: Dictionary.email,
                        keyboardType: .emailAddress)
                        .padding(.top, 12)
                        
                        InputTextfieldView(
                        text: self.$pass,
                        placeholder: Dictionary.password,
                        keyboardType: .default)
                        .padding(.top, 12)
                        
                        InputTextfieldView(
                        text: self.$repass,
                        placeholder: Dictionary.passwordConfirm,
                        keyboardType: .default)
                        .padding(.top, 12)
                        
                        Button(action: {
                            
                            self.register()
                        }) {
                            
                            Text(Dictionary.register)
                                .tracking(2)
                                .font(.custom("open-sans.bold", size: 18))
                                .fontWeight(.bold)
                                .foregroundColor(MyColor.whiteColors)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(MyColor.orangButtonColors)
                        .cornerRadius(6)
                        
                        Button(action: {
                            self.show.toggle()
                        }) {
                            Text(Dictionary.alreadyHA)
                                .font(.custom("open-sans.regular", size: 12))
                                .fontWeight(.regular)
                                .foregroundColor(MyColor.grayColors)
                            + Text(Dictionary.login)
                                .font(.custom("open-sans.regular", size: 12))
                                .fontWeight(.regular)
                                .foregroundColor(MyColor.orangButtonColors)
                        }.padding(.top, 10)

                        }
                        
                    }
                    .padding([.horizontal, .vertical], 16)
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
            .background(MyColor.backgroundColors).edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
    
    func register(){
        
        if self.email != ""{
            
            if self.pass == self.repass{
                
                Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in
                    
                    if err != nil{
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    
                    print(Dictionary.success)
                    
                    UserDefaults.standard.set(true, forKey: Dictionary.status)
                    NotificationCenter.default.post(name: NSNotification.Name(Dictionary.status), object: nil)
                }
            }
            else{
                
                self.error = Dictionary.passwordDNM
                self.alert.toggle()
            }
        }
        else{
            
            self.error = Dictionary.pleaseFill
            self.alert.toggle()
        }
    }
}
