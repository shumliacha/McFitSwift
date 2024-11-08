//
//  LoginView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 17.08.2024.

// TO DO
// open keyboard on device when tapped on field & ad hide with swipe
// animation

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = AuthViewModel()
    
    
    var body: some View {
        if viewModel.isAuthenticated {
            
            //VIEW ON LOAD IF AUTH IS FINE
            
            MainTabView()
        } else {
            NavigationView {
                ZStack{
                    
                    RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
                    
                    VStack {
                        Spacer()
                        
                        HStack{
                            Image("AppIconM")
                                .resizable()
                                .frame(width: 90, height: 90)
                            
                            Text("McSwift")
                                .font(.title.bold())
                                .foregroundStyle(Color.white)
                        }
                        .padding(EdgeInsets(top: 50, leading: 0, bottom: 110, trailing: 60))
                        
                        
                        
                        GroupBox {
                            VStack {
                                Text("Login")
    // OMG AM I BLIND
    // Sign Up view should be here the fs
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 0))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                InputFieldView(data: $viewModel.email, title: "Email", isSecured: false)
                                    .textContentType(.emailAddress)
                                    .textInputAutocapitalization(.never)
                                
                                InputFieldView(data: $viewModel.password, title: "Password", isSecured: true)
                                    .textContentType(.newPassword)
                                    .textInputAutocapitalization(.never)
                                
                                
                            }
                        }
                        
                        .padding()
                        
                        //can and must be done by custom view for buttons
                        Button(action: {
                            viewModel.signIn()
                        }){
                            Text("Sign In")
                                .fontWeight(.heavy)
                                .font(.callout)
                                .frame(maxWidth: .infinity)
                                .padding(15)
                                .foregroundColor(Color.systemTextBlack)
                                .background(Color.contrastButton)
                                .cornerRadius(60)
                        }
                        .padding(EdgeInsets(top: 30, leading: 40, bottom: 20, trailing: 40))
                        
                        
                        //Spacer()
                        
                        NavigationLink(destination: {
                            SignUpView(viewModel: viewModel.makeCreateAccountViewModel())
                        }, label: {
                            Text("Log In")
                                .fontWeight(.semibold)
                                .font(.callout)
                                .foregroundColor(Color.white)
                        })
                        .padding(EdgeInsets(top: 0, leading: 40, bottom: 20, trailing: 40))
                        

                    }
                    .frame(maxWidth: 700)
                }
            }
            
            
        }
    }
}



#Preview {
    LoginView()
}
