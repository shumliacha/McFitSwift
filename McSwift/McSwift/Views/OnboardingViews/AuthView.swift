//
//  AuthView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//

import Foundation

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()

    var body: some View {
        if viewModel.isAuthenticated {
            MainTabView()
        } else {
            NavigationView {
                SignInForm(viewModel: viewModel.makeSignInViewModel()) {
                    NavigationLink("Create Account", destination: CreateAccountForm(viewModel: viewModel.makeCreateAccountViewModel()))
                }
            }
        }
    }
}

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
            Button("Create Account", action: viewModel.submit)
                
            Button("Sign In", action: dismiss.callAsFunction)
                .padding()
        }
        .onSubmit(viewModel.submit)
        .alert("Cannot Create Account", error: $viewModel.error)
        .disabled(viewModel.isWorking)
    }

}

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
        } footer: {
            Button("Sign In", action: viewModel.submit)
                
            footer()
                .padding()
        }
        .onSubmit(viewModel.submit)
        .alert("Cannot Sign In", error: $viewModel.error)
        .disabled(viewModel.isWorking)
    }
}

private struct Form<Content: View, Footer: View>: View {
    @ViewBuilder let content: () -> Content
    @ViewBuilder let footer: () -> Footer
    
    var body: some View {
        VStack {
            Text("Socialcademy")
                .font(.title.bold())
            content()
                .padding()
                .background(Color.secondary.opacity(0.15))
                .cornerRadius(10)
            footer()
        }
        .navigationBarHidden(true)
        .padding()
    }
}

#Preview {
    AuthView()
}

