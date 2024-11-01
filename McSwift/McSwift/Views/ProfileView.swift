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
    
//@ObservedObject var viewModel: UserService
    @StateObject var viewModel = UserService(uid: String(Auth.auth().currentUser!.uid))
    
//    init(userData: UserData) {
//        self.viewModel = UserService(userData: userData)
//    }
//    
//    init(uid: String) {
//        self.viewModel = UserService(uid: uid)
//    }
            
        var body: some View {
            Button("Sign Out", action: {
                try! Auth.auth().signOut()
            })
            
            Text(viewModel.userData.contract.rawValue)
        }
        
    }


#Preview {
    //ProfileView(userData: UserData(dictionary: ["contract": "123456789"]))
}
