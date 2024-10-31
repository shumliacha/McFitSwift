//
//  UserService.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class UserService {
    
//   // guard let userID = Auth.auth().currentUser?.uid else { return }
//    static func fetchUserWithUid(uid: String, completion: @escaping(User) -> Void) {
//        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
//            guard let dictionary = snapshot?.data() else { return }
//            let user = User(dictionary: dictionary)
//            completion(user)
//        }
//    }
    
    @Published var userData: UserData


    static func fetchUserWithUid(uid: String, completion: @escaping(UserData) -> Void) {
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            guard let dictionary = snapshot?.data() else { return }
            let user = UserData(dictionary: dictionary)
            completion(user)
        }
    }

}
