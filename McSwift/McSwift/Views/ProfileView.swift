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
    
    @StateObject var viewModel = BlogData()
    
    
    var body: some View {
        Button("Sign Out", action: {
            try! Auth.auth().signOut()
        })
    }
    
    fetchUserWithUid(uid: uid) { user in
        // Handle the fetched user data
        print(user)
    }
    
}

#Preview {
    ProfileView()
}
