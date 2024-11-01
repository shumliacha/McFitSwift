//
//  UserService.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
class UserService: ObservableObject {

    @Published var userData: UserData
    
    let uid: String
    
//    init(userData: UserData) {
//        self.userData = userData
//    }
    
    init(uid: String) {
        self.userData = UserData.empty
        self.uid = String(Auth.auth().currentUser!.uid)
        fetchProfile(uid)
      }
    
    private var db = Firestore.firestore()
    
    func fetchUID() -> String {
        String(Auth.auth().currentUser!.uid)
    }

    func fetchProfile(_ uid: String) {
        db.collection("users")
          .whereField("uid", isEqualTo: uid)
          .getDocuments { querySnapshot, error in
            if let error = error {
              print("Error getting documents: \(error)")
            }
            else {
              if let querySnapshot = querySnapshot {
                if let document = querySnapshot.documents.first {
                  do {
                    self.userData = try document.data(as: UserData.self)
                  }
                  catch {
                    
                  }
                }
              }
            }
              
          }
      }

}


