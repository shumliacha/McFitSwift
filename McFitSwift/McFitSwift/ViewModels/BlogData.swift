//
//  BlogViewModel.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 08.09.2024.
//

import Foundation
import Combine

@MainActor
class BlogData: ObservableObject {
    
    @Published var blogPosts = BlogPost.testPost
    
    //func fetchPosts
    // maybe filter too for favourite posts
    
}

