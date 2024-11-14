//
//  AuthView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
// ver 2 of login view, not sure about ui choices

import Foundation

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
    @State private var isNewSignUp: Bool = false
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var phone: String = ""
    
    @State private var birthDate = Date.now
    @State private var courses: String = ""
    
    @FocusState private var focusing: FocusedField?

    var body: some View {
        NavigationView {
            ZStack{

                RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()

                VStack {
                    
                    Spacer()
                    Spacer()
                    Spacer()


                    HStack{
                        Image("AppIconM")
                            .resizable()
                            .frame(width: 90, height: 90)

                        Text("McSwift")
                            .font(.title.bold())
                            .foregroundStyle(Color.white)
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 60))
                    
                    Spacer()
                    Spacer()



//_________CHANGE FROM HERE__________________

                    GroupBox {
                        VStack {
                            if isNewSignUp {
                                Text("Create an Account")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 0))
                                    .frame(maxWidth: .infinity, alignment: .leading)

                            } else {
                                Text("Login")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 0))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            

                            InputFieldView(data: $viewModel.email, title: "Email", isSecured: false)
                                .textContentType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .focused($focusing, equals: .email)

                            InputFieldView(data: $viewModel.password, title: "Password", isSecured: true)
                                .textContentType(.newPassword)
                                .textInputAutocapitalization(.never)
                                .focused($focusing, equals: .password)
                                .submitLabel(.done)
                            
                            if isNewSignUp {
                                
                                InputFieldView(data: $firstName, title: "First Name", isSecured: false)
                                
                                InputFieldView(data: $lastName, title: "Last Name", isSecured: false)
                                
                                InputFieldView(data: $phone, title: "Phone Number", isSecured: false)
                                
                                InputFieldView(data: $courses, title: "Your Courses", isSecured: false)
                                Picker("Courseeeeeee", selection: $courses) {
                                    Text("Courses")
                                }
                                
                                DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                                                Text("Date of Birth")
                                            }
                            }

                        }
                        .onSubmit {
                                    if focusing == .email {
                                        focusing = .password
                                    } else {
                                        focusing = nil
                                    }
                                }

                    }

//________GROUP FORM END BUTTONS BELLOW
                    .padding()

                    //can and must be done by custom view for buttons
                    Button(action: {
                        viewModel.signIn()
                    }){
                        Text("Log In")
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
                        Text("Create an Account")
                            .fontWeight(.semibold)
                            .font(.callout)
                            .foregroundColor(Color.white)
                    })
                    .padding(EdgeInsets(top: 0, leading: 40, bottom: 20, trailing: 40))

// __________VSTACK ENDS HERE
                }
                .frame(maxWidth: 700)
            }
        }
}

}


#Preview {
    AuthView()
}

