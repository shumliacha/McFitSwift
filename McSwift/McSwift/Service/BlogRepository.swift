//
//  BlogRepository.swift
//  McSwift
//
//  Created by Kristina Litvinova on 29.10.2024.
//

import Foundation
import FirebaseFirestore
import Firebase

protocol BlogRepositoryProtocol {
//    func fetchBlogPosts(from query: Query) async throws -> [BlogPost]
    func fetchAllBlogPosts() async throws -> [BlogPost]
}

struct BlogRepository: BlogRepositoryProtocol {
    
    let postsReference = Firestore.firestore().collection("posts")
    
    func fetchAllBlogPosts() async throws -> [BlogPost] {
        return try await fetchBlogPosts(from: postsReference)
    }

    
    func fetchBlogPosts(from query: Query) async throws -> [BlogPost] {
        let snapshot = try await query
            .order(by: "timestamp", descending: true)
            .getDocuments()
        return snapshot.documents.compactMap { document in
            try! document.data(as: BlogPost.self)
        }
    }
}


#if DEBUG
struct BlogRepositoryStub: BlogRepositoryProtocol {
    let state: Loadable<[BlogPost]>
    
    func fetchAllBlogPosts() async throws -> [BlogPost] {
        return try await state.simulate()
    }

}
#endif

