//
//  BlogRepository.swift
//  McSwift
//
//  Created by Kristina Litvinova on 29.10.2024.
//

import Foundation
import FirebaseFirestore
import Firebase


struct BlogRepository{
    
    let postsReference = Firestore.firestore().collection("posts")
    
    private func fetchBlogPosts(from query: Query) async throws -> [BlogPost] {
        let snapshot = try await query
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap { document in
            try! document.data(as: BlogPost.self)
        }
    }

}


