//
//  AuthService.swift
//  McSwift
//
//  Created by Kristina Litvinova on 08.09.2024.
//

import Foundation
import FirebaseAuth


@MainActor class AuthService: ObservableObject {
    
  
    @Published var isAuthenticated = false
    
    private let auth = Auth.auth()
    
    private var listener: AuthStateDidChangeListenerHandle?
    
    init() {
        listener = auth.addStateDidChangeListener { [weak self] _, user in
            self?.isAuthenticated = user != nil
        }
    }
    
    func createAccount(name: String, email: String, password: String) async throws {
        //FirebaseAuth
        let result = try await auth.createUser(withEmail: email, password: password)
        try await result.user.updateProfile(\.displayName, to: name)
    }
     
//    func writeUserData(uid: UUID) async throws {
//        
//    //CloudStorage
//        
//        do {
//          try await db.collection("users").document(uid).setData([
//            "name": "Los Angeles",
//            "state": "CA",
//            "country": "USA"
//          ])
//          print("Document successfully written!")
//        } catch {
//          print("Error writing document: \(error)")
//        }
//        
//   }
    
    func signIn(email: String, password: String) async throws {
        try await auth.signIn(withEmail: email, password: password)
    }

    func signOut() throws {
        try auth.signOut()
    }
}

private extension FirebaseAuth.User {
    func updateProfile<T>(_ keyPath: WritableKeyPath<UserProfileChangeRequest, T>, to newValue: T) async throws {
        var profileChangeRequest = createProfileChangeRequest()
        profileChangeRequest[keyPath: keyPath] = newValue
        try await profileChangeRequest.commitChanges()
    }
}
