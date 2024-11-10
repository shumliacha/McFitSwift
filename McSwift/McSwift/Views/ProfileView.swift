//
//  ProfileView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//


//TRY showing email and password here


import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    
    @StateObject var viewModel = UserService(uid: String(Auth.auth().currentUser!.uid))
    
            
        var body: some View {
            NavigationStack {
                Form {
                    Button("Sign Out", action: {
                        try! Auth.auth().signOut()
                    })
                    
                    Text(viewModel.userData.contract.rawValue)
                }
                .navigationTitle("Profile")
            }
        }
        
    }


#Preview {
    //ProfileView(userData: UserData(dictionary: ["contract": "123456789"]))
}
