//
//  BlogViewModel.swift
//  McSwift
//
//  Created by Kristina Litvinova on 08.09.2024.
//

import Foundation
import FirebaseFirestore

@MainActor
class BlogDataViewModel: ObservableObject {
    
    @Published var posts: Loadable<[BlogPost]> = .loading
    private let blogRepository: BlogRepositoryProtocol
    
    init(blogRepository: BlogRepositoryProtocol = BlogRepository()) {
        self.blogRepository = blogRepository
    }
        
    func fetchPosts() {
        Task {
            do {
                posts = .loaded(try await blogRepository.fetchAllBlogPosts())
            } catch {
                print("[PostsViewModel] Cannot fetch posts: \(error)")
                posts = .error(error)
            }
        }
    }
    
    func makeBlogPostViewModel(for post: BlogPost) -> BlogPostViewModel {
        return BlogPostViewModel(blogPost: post)
    }
    
}


private extension BlogRepositoryProtocol {
    func fetchPosts() async throws -> [BlogPost] {
            return try await fetchAllBlogPosts()
        
    }
}
