//
//  BlogRepository.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 29.10.2024.
//

import Foundation
import FirebaseFirestore
import Firebase

struct PostsRepository {
    static let postsReference = Firestore.firestore().collection("posts")

    static func create(_ post: BlogPost) async throws {
    let document = postsReference.document(post.id.uuidString)
    try await document.setData(from: post)
    
    }
}

//No 'async' operations occur within 'await' expression - fix below

private extension DocumentReference {
    func setData<T: Encodable>(from value: T) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            //Method throws if there’s an encoding error
            try! setData(from: value) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                continuation.resume()
            }
        }
    }
}
