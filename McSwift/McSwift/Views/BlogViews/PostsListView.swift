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

struct PostsListView: View {
    
    @StateObject var viewModel = BlogDataViewModel()
    
    @State private var searchText = ""
    
     var body: some View {
        NavigationStack {
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
                        message: "There aren’t any posts in the Blog yet."
                    )
                    
                case let .loaded(posts):
                   List(posts) { post in
                       PostPreview(viewModel: viewModel.makeBlogPostViewModel(for: post))
                    }
                    .searchable(text: $searchText)
            }
  //              .navigationTitle("Blog")
        }
        .onAppear {
                viewModel.fetchPosts()
            }
        
          RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
    }
}

#Preview {
    PostsListView()
}
