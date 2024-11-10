//
//  BlogPostViewModel.swift
//  McSwift
//
//  Created by Kristina Litvinova on 02.11.2024.
//

import Foundation

@MainActor
@dynamicMemberLookup

class BlogPostViewModel: ObservableObject {
    @Published var blogPost: BlogPost
    
    init(blogPost: BlogPost) {
        self.blogPost = blogPost
    }
    
    subscript<T>(dynamicMember keyPath: KeyPath<BlogPost, T>) -> T {
        blogPost[keyPath: keyPath]
    }
}
