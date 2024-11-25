//
//  AuthView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
// ver 2 of login view

import Foundation

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
//    @State private var isNewSignUp: Bool = false
//    
//    @State private var firstName: String = ""
//    @State private var lastName: String = ""
//    @State private var phone: String = ""
//    
//    @State private var birthDate = Date.now
//    @State private var courses: String = ""
//    
//    @FocusState private var focusing: FocusedField?


        var body: some View {
            if viewModel.isAuthenticated {
                MainTabView()
            } else {
                NavigationView {
                    SignInForm(viewModel: viewModel.makeSignInViewModel()) {
                        NavigationLink("Create Account", destination: CreateAccountForm(viewModel: viewModel.makeCreateAccountViewModel()))
                            .foregroundStyle((Color.white.opacity(0.55)))
                            .fontWeight(.medium)

                    }
                }
            }
        }
    }




//--------------------  CREATE ACCOUNT ---------------------





    struct CreateAccountForm: View {
        @StateObject var viewModel: AuthViewModel.CreateAccountViewModel
        @Environment(\.dismiss) private var dismiss

        var body: some View {
            Form {
                TextField("Name", text: $viewModel.name)
                    .textContentType(.name)
                    .textInputAutocapitalization(.words)
                TextField("Email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $viewModel.password)
                    .textContentType(.newPassword)
            } footer: {
                
                
                
                Button(action: viewModel.submit, label: {
                    Text("Create Account")
                        .fontWeight(.bold)
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                        .padding(15)
                        .foregroundColor(Color.systemTextBlack)
                        .background(Color.contrastButton)
                        .cornerRadius(60)
                })
                .padding(EdgeInsets(top: 30, leading: 40, bottom: 20, trailing: 40))
                
                
                
                Button(action: dismiss.callAsFunction, label: {
                    Text("Sign In")
                        .foregroundStyle((Color.white.opacity(0.55)))
                        .fontWeight(.medium)
                })

                
                
                
            }
            
            .onSubmit(viewModel.submit)
            .alert("Cannot Create Account", error: $viewModel.error)
            .disabled(viewModel.isWorking)
        }

    }






//----------------------- SIGN IN -------------------------------




    struct SignInForm<Footer: View>: View {
        @StateObject var viewModel: AuthViewModel.SignInViewModel
        @ViewBuilder let footer: () -> Footer
        
        var body: some View {
            Form {
                TextField("Email", text: $viewModel.email)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    
                SecureField("Password", text: $viewModel.password)
                    .textContentType(.password)
            }  footer: {
                Button(action: {
                    viewModel.submit()
                }){
                    Text("Sign In")
                        .fontWeight(.bold)
                        .font(.callout)
                        .frame(maxWidth: .infinity)
                        .padding(15)
                        .foregroundColor(Color.systemTextBlack)
                        .background(Color.contrastButton)
                        .cornerRadius(60)
                }
                .padding(EdgeInsets(top: 30, leading: 40, bottom: 0, trailing: 40))
                
                footer()
                    .padding()
            }
            .onSubmit(viewModel.submit)
            
            .alert("Cannot Sign In", error: $viewModel.error)
            .disabled(viewModel.isWorking)
        }
    }





//------------------------ FORM ------------------------




    private struct Form<Content: View, Footer: View>: View {
        @ViewBuilder let content: () -> Content
        @ViewBuilder let footer: () -> Footer
        
        var body: some View {
            ZStack {
                        RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                 .ignoresSafeArea()
             
                VStack {
                    
                    HStack{
                        Image("AppIconM")
                            .resizable()
                            .frame(width: 90, height: 90)

                        Text("McSwift")
                            .font(.title.bold())
                            .foregroundStyle(Color.init(uiColor: .white))
                    }
                    .padding(EdgeInsets(top: 50, leading: 0, bottom: 110, trailing: 60))
                    
                    
                    content()
                        .padding()
                        .background(Color.systemBackgroundWhite.opacity(0.75))
                        .cornerRadius(10)
                    footer()
                        
                }
                .padding()           .navigationBarHidden(true)

            }
        }
    }

    #Preview {
        AuthView()
    }
