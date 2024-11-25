//
//  SignUpView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
// ver 1 of login

//TO DO
// Change back button to white or sth else but not blue, and put it on thick material
//fix scroll, button should be under the form

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: AuthViewModel.CreateAccountViewModel
    
    //TEMPORARY
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phone: String = ""
    
    @State private var birthDate = Date.now
    @State private var courses: String = ""
    
    @FocusState private var focusing: FocusedField?
    @State private var selectedCourses: [String] = []
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
                
                ScrollView {
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
                                VStack {
                                    Text("Create an Account")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .padding(EdgeInsets(top: 5, leading: 10, bottom: 30, trailing: 0))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    
                                    
                                    InputFieldView(data: $viewModel.email, title: "Email", isSecured: false)
                                        .textContentType(.emailAddress)
                                        .textInputAutocapitalization(.never)
                                    
                                    InputFieldView(data: $viewModel.password, title: "Password", isSecured: true)
                                        .textContentType(.newPassword)
                                        .textInputAutocapitalization(.never)
                                    
                                    InputFieldView(data: $firstName, title: "First Name", isSecured: false)
                                        .autocorrectionDisabled()
                                        .textInputAutocapitalization(.words)
                                        .background(.background)
                                        .onTapGesture {
                                            focusing = .firstName
                                        }
                                        .textContentType(.name)
                                        .submitLabel(.next)
                                    
                                    InputFieldView(data: $lastName, title: "Last Name", isSecured: false)
                                    
                                    InputFieldView(data: $phone, title: "Phone Number", isSecured: false)
                                    
                                    
                                    
                                    Picker("Courseeeeeee", selection: $courses) {
                                        Text("Courses")
                                    }
                                    
                                    DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                                                    Text("Date of Birth")
                                                }
                                    
                                }
                        }
                        
                        .padding()
                        
                        //can and must be done by custom view for buttons
                        Button(action: { viewModel.submit()
                        }){
                            Text("Sign Up")
                                .fontWeight(.heavy)
                                .font(.callout)
                                .frame(maxWidth: .infinity)
                                .padding(15)
                                .foregroundColor(Color.systemTextBlack)
                                .background(Color.contrastButton)
                                .cornerRadius(60)
                        }
                        .padding(EdgeInsets(top: 10, leading: 40, bottom: 10, trailing: 40))
                        
                    }
                }
                .frame(maxWidth: 700)
            }
        }
        .accentColor(.white)
    }
}



//#Preview {
//    SignUpView(viewModel: viewModel)
//}



//-------------------------------------------------
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
