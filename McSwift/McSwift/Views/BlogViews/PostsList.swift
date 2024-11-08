//
//  PostsList.swift
//  McSwift
//
//  Created by Kristina Litvinova on 18.08.2024.


// TO DO
// Hide the search bar until swiped down
// open keyboard when pressed on it
// link works but ui does not


import SwiftUI

struct PostsList: View {
    
    @StateObject var viewModel = BlogData()
    
    @State private var searchText = ""
    @State private var showNewPostForm = false
    
     var body: some View {
        NavigationStack {
            
            Group {
                switch viewModel.posts {
                case .loading:
                    ProgressView()
                case let .error(error):
                    EmptyListView(
                        title: "Cannot Load Posts",
                        message: error.localizedDescription,
                        retryAction: {
                            viewModel.fetchPosts()
                        }
                    )

                case .empty:
                    EmptyListView(
                        title: "No Posts",
                        message: "There aren’t any posts yet."
                    )
                    
                case let .loaded(posts):
                    List(posts) { post in
                        if searchText.isEmpty || post.contains(searchText) {
                            //PostRreview(viewModel: viewModel.makePostRowViewModel(for: post))
                            PostPreview(post: post)
                        }
                    }
                    .searchable(text: $searchText)
                    //.animation(.default, value: posts)
                }
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
