//
//  View.swift
//  McSwift
//
//  Created by Kristina Litvinova on 03.11.2024.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

class ViewModel: ObservableObject {
    @Published var posts: [BlogPost] = []
    private var db = Firestore.firestore()

    init() {
        fetchPosts()
    }

    func fetchPosts() {
        db.collection("posts").order(by: "timestamp", descending: true).getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching posts: \(error.localizedDescription)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("No documents found in 'posts' collection")
                return
            }

            // Mapping documents to Post objects
            self.posts = documents.compactMap { doc -> BlogPost? in
                let data = doc.data()
                guard let title = data["title"] as? String,
                      let authorName = data["authorName"] as? String,
                      let text = data["text"] as? String,
                      let timestamp = data["timestamp"] as? Timestamp,
                      let tags = data["tags"] as? Tags                else {
                    return nil
                }
                
                return BlogPost(title: title, authorName: authorName, timestamp: timestamp.dateValue(), text: text, id: UUID(uuidString: doc.documentID)!, tags: tags)
            }
        }
    }
    
    
}
