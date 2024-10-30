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
            
            HomeView()
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
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 80, trailing: 60))
                    
                    
                    
                    GroupBox {
                        VStack {
                            Text("Login")
// OMG AM I BLIND
// Sign Up view should be here the fs
                                .font(.title3)
                                .fontWeight(.black)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 0))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            InputFieldView(data: $viewModel.email, title: "Email")
                                .textContentType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            
                            InputFieldView(data: $viewModel.password, title: "Password")
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
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
                    .padding(EdgeInsets(top: 60, leading: 40, bottom: 0, trailing: 40))
                    
                    Button(action: {
                        SignUpView()
                    }){
                        Text("Create an Account")
                            .fontWeight(.semibold)
                            .font(.callout)
                            .frame(maxWidth: .infinity)
                            .padding(15)
                            .foregroundColor(Color.white)
                            .cornerRadius(60)
                    }
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 20, trailing: 40))
                    
                    
                    Spacer()
                    
                    Text("Developed by shumliacha for learning purposes")
                        .font(.callout)
                        .foregroundStyle(Color.mcsPurple)
                    Text("please don't sue me, McFit T-T")
                        .font(.callout)
                        .foregroundStyle(Color.mcsPurple)
                }
                .frame(maxWidth: 700)
            }
            
            
        }
    }
}

struct InputFieldView: View { // https://ix76y.medium.com/create-a-login-page-in-swiftui-aab664a7f96f
    //added securefiels for passwords
    @Binding var data: String //this prwrapper  cssuse this property wil be passed and changed later
    var title: String?
    
    var body: some View {
        ZStack {
            if title == "Password" {
                SecureField("", text: $data)
                    .padding(.horizontal, 10)
                    .frame(height: 42)
                    .overlay( //owwww, sth new
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.gray, lineWidth: 1)
                        )
            } else {
                TextField("", text: $data)
                    .padding(.horizontal, 10)
                    .frame(height: 42)
                    .overlay( //owwww, sth new
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.gray, lineWidth: 1)
                        )
            }
                
            HStack{
                Text(title ?? "Input")
                    .font(.headline)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background()
                Spacer()
            }
            .padding(.leading, 8)
            .offset(CGSize(width: 0, height: -20))
        }
        .padding(4)
    }
}

#Preview {
    LoginView()
}
