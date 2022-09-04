//
//  LoginScreen.swift
//  news
//
//  Created by Teguh Satrio on 9/2/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginScreen: View {
    
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        
        ZStack{
            
            ZStack(alignment: .topTrailing) {
                
                GeometryReader{_ in
                    
                    VStack{
                        
                        HStack {
                            Text(Dictionary.welcome)
                            .font(.custom("SFPRODISPLAYBOLD", size: 34))
                                .fontWeight(.semibold)
                                .foregroundColor(MyColor.boldHeader)
                            .padding(.top, 30)
                        Spacer()
                        }
                        HStack {
                            Text(Dictionary.enterEmail)
                            .font(.custom("SFPRODISPLAYREGULAR", size: 18))
                            .fontWeight(.regular)
                                .foregroundColor(MyColor.grayColors)
                                .lineLimit(2)
                        Spacer()
                        }
                        
                        InputTextfieldView(
                            text: self.$email,
                            placeholder: Dictionary.email,
                            keyboardType: .emailAddress).padding(.top, 72)
                        
                        InputTextfieldView(
                            text: self.$pass,
                            placeholder: Dictionary.password,
                            keyboardType: .default)
                            .padding(.top, 12)
                        
                        HStack{
                            
                            Spacer()
                            
                            Button(action: {
                                
                                self.reset()
                                
                            }) {
                                 Text(Dictionary.forgetPassword)
                                    .font(.custom("open-sans.regular", size: 14))
                                    .fontWeight(.regular)
                                    .foregroundColor(MyColor.grayColors)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 34)
                        
                        Button(action: {
                            
                            self.verify()
                            
                        }) {
                            
                            Text(Dictionary.login)
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
                            Text(Dictionary.dontHA)
                                .font(.custom("open-sans.regular", size: 12))
                                .fontWeight(.regular)
                                .foregroundColor(MyColor.grayColors)
                            + Text(Dictionary.createNA)
                                .font(.custom("open-sans.regular", size: 12))
                                .fontWeight(.regular)
                                .foregroundColor(MyColor.orangButtonColors)
                        }.padding(.top, 10)
                    }
                    .padding([.horizontal, .vertical], 16)
                }
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }.background(MyColor.backgroundColors).edgesIgnoringSafeArea(.all)
    }
    
    func verify(){
        
        if self.email != "" && self.pass != ""{
            
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                
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
            
            self.error = Dictionary.pleaseFill
            self.alert.toggle()
        }
    }
    
    func reset(){
        
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                self.error = Dictionary.reset
                self.alert.toggle()
            }
        }
        else{
            
            self.error = Dictionary.emailEmpty
            self.alert.toggle()
        }
    }
}
