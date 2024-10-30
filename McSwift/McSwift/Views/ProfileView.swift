//
//  ProfileView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        Button("Sign Out", action: {
            try! Auth.auth().signOut()
        })
    }
}

#Preview {
    ProfileView()
}
