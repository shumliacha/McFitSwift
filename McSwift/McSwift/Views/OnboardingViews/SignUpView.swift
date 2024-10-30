//
//  SignUpView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        
        ZStack {
            
            RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
            
            VStack(alignment: .center){
                
                HStack {
                    Image("AppIconM")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    Text("McSwift")
                        .font(.title.bold())
                        .foregroundStyle(Color.white)
                }
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 20))
                
                
                
                GroupBox {
                    ScrollView {
                        VStack {
                            Text("Create an Account")
                            // OMG AM I BLIND
                            // Sign Up view should be here the fs
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 0))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            InputFieldView(data: $viewModel.email, title: "Email", isSecured: false)
                                .textContentType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                            
                            InputFieldView(data: $viewModel.password, title: "Password", isSecured: true)
                                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                                .textContentType(.newPassword)
                                .textInputAutocapitalization(.never)
                            
                            
                        }
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



#Preview {
    SignUpView()
}

// IDEEEEKKKKKK


//import SwiftUI
//
//struct AuthView: View {
//    @StateObject var viewModel = AuthViewModel()
//
//    var body: some View {
//        if viewModel.isAuthenticated {
//            MainTabView()
//        } else {
//            NavigationView {
//                SignInForm(viewModel: viewModel.makeSignInViewModel()) {
//                    NavigationLink("Create Account", destination: CreateAccountForm(viewModel: viewModel.makeCreateAccountViewModel()))
//                }
//            }
//        }
//    }
//}
//
//struct CreateAccountForm: View {
//    @StateObject var viewModel: AuthViewModel.CreateAccountViewModel
//    @Environment(\.dismiss) private var dismiss
//
//    var body: some View {
//        Form {
//            TextField("Name", text: $viewModel.name)
//                .textContentType(.name)
//                .textInputAutocapitalization(.words)
//            TextField("Email", text: $viewModel.email)
//                .textContentType(.emailAddress)
//                .textInputAutocapitalization(.never)
//            SecureField("Password", text: $viewModel.password)
//                .textContentType(.newPassword)
//        } footer: {
//            Button("Create Account", action: viewModel.submit)
//                .buttonStyle(.primary)
//            Button("Sign In", action: dismiss.callAsFunction)
//                .padding()
//        }
//        .onSubmit(viewModel.submit)
//        .alert("Cannot Create Account", error: $viewModel.error)
//        .disabled(viewModel.isWorking)
//    }
//
//}
//
//struct SignInForm<Footer: View>: View {
//    @StateObject var viewModel: AuthViewModel.SignInViewModel
//    @ViewBuilder let footer: () -> Footer
//    
//    var body: some View {
//        Form {
//            TextField("Email", text: $viewModel.email)
//                .textContentType(.emailAddress)
//                .textInputAutocapitalization(.never)
//            SecureField("Password", text: $viewModel.password)
//                .textContentType(.password)
//        } footer: {
//            Button("Sign In", action: viewModel.submit)
//                .buttonStyle(.primary)
//            footer()
//                .padding()
//        }
//        .onSubmit(viewModel.submit)
//        .alert("Cannot Sign In", error: $viewModel.error)
//        .disabled(viewModel.isWorking)
//    }
//}
//
//private struct Form<Content: View, Footer: View>: View {
//    @ViewBuilder let content: () -> Content
//    @ViewBuilder let footer: () -> Footer
//    
//    var body: some View {
//        VStack {
//            Text("Socialcademy")
//                .font(.title.bold())
//            content()
//                .padding()
//                .background(Color.secondary.opacity(0.15))
//                .cornerRadius(10)
//            footer()
//        }
//        .navigationBarHidden(true)
//        .padding()
//    }
//}
//
//#Preview {
//    AuthView()
//}
//
