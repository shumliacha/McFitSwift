//
//  LoginView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 17.08.2024.

// TO DO
// show that field is in focus by darkening overline
// open keyboard on device when tapped on field
// sign up field
// animation

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = AuthViewModel()
    
    
    var body: some View {
        if viewModel.isAuthenticated {
            
            //VIEW ON LOAD IF AUTH IS FINE
            
            MainTabView()
        } else {
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
                    .padding(EdgeInsets(top: 60, leading: 0, bottom: 80, trailing: 60))
                    
                    
                    
                    GroupBox {
                        VStack {
                            Text("Login")
// OMG AM I BLIND
// Sign Up view should be here the fs
                                .font(.title3)
                                .fontWeight(.black)
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
                    .padding(EdgeInsets(top: 30, leading: 40, bottom: 0, trailing: 40))
                    
                    
                    Spacer()
                    
                    Button {
                        print("Create PRESSED")
                    } label: {
                        Text("Create an Account")
                            .fontWeight(.semibold)
                            .font(.callout)
                            .foregroundColor(Color.white)
                    }
                    .ignoresSafeArea()

                }
                .frame(maxWidth: 700)
            }
            
            
        }
    }
}



#Preview {
    LoginView()
}
