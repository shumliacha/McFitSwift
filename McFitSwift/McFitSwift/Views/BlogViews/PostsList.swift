//
//  PostsList.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 18.08.2024.
//

import SwiftUI

struct PostsList: View {
    
    @State private var searchText = ""
    private var posts = [BlogPost.testPost]
    
     var body: some View {
        NavigationStack {
                List (posts) { post in
                    if searchText.isEmpty || post.contains(searchText) {
                        PostPreview(post: post)
                    }
                    //PostPreview(post: post)
                    //PostRow(post: post)
                }
                .searchable(text: $searchText)
            
                .navigationTitle("Blog")
        }
    
        
         // RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
    }
}

#Preview {
    PostsList()
}
