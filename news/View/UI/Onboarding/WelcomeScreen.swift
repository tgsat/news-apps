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

