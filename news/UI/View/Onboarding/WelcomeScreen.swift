//
//  WelcomeScreen.swift
//  news
//
//  Created by Teguh Satrio on 9/4/22.
//  Copyright © 2022 tgsatt. All rights reserved.
//

import SwiftUI

struct WelcomeScreen : View {
    
    @State var show = false
        @State var status = UserDefaults.standard.value(forKey: Dictionary.status) as? Bool ?? false
        
        var body: some View{
            
            NavigationView{
                
                VStack{
                    
                    if self.status{
                        Homescreen()
                    }
                    else{
                        
                        ZStack{
                            
                            NavigationLink(destination: RegisterScreen(show: self.$show), isActive: self.$show) {
                                
                                Text("")
                            }
                            .hidden()
                            
                            LoginScreen(show: self.$show)
                        }
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .onAppear {
                    
                    NotificationCenter.default.addObserver(forName: NSNotification.Name(Dictionary.status), object: nil, queue: .main) { (_) in
                        
                        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    }
                }
            }
        }
    }

struct ErrorView : View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                
                HStack{
                    
                    Text(self.error == Dictionary.reset ? Dictionary.message : Dictionary.error)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error == Dictionary.reset ? Dictionary.passwordReset : self.error)
                .foregroundColor(self.color)
                .padding(.top)
                .padding(.horizontal, 25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    
                    Text(self.error == Dictionary.reset ? Dictionary.oke : Dictionary.cancel)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(MyColor.articleColors)
                .cornerRadius(10)
                .padding(.top, 25)
                
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}

