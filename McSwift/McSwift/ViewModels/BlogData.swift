//
//  BlogViewModel.swift
//  McSwift
//
//  Created by Kristina Litvinova on 08.09.2024.
//

import Foundation
import FirebaseFirestore

@MainActor
class BlogData: ObservableObject {
    
    @Published var posts: Loadable<[BlogPost]> = .loading
    private let blogRepository: BlogRepository
    private let filter: Filter
    
    var title: String {
        switch filter {
        case .all:
            return "Posts"
        case .favorites:
            return "Favorites"
        }
    }


    init(filter: Filter = .all, blogPostsRepository: BlogRepositoryProtocol = BlogRepository()) {
        self.filter = filter
        self.blogPostsRepository = blogPostsRepository
    }
    
    enum Filter {
        case all, favorites
    }
    
    func fetchPosts() {
        Task {
            do {
                posts = .loaded(try await blogRepository.fetchBlogPosts())
            } catch {
                print("[PostsViewModel] Cannot fetch posts: \(error)")
                posts = .error(error)
            }
        }
    }
    
}

private extension BlogRepositoryProtocol {
    func fetchPosts(matching filter: BlogData.Filter) async throws -> [BlogPost] {
        switch filter {
        case .all:
            return try await fetchAllPosts()
        case .favorites:
            return try await fetchFavoritePosts()
        }
    }
}


