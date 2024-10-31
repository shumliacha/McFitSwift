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
                List (posts) { post in
                    if searchText.isEmpty || post.contains(searchText) {
                        NavigationLink(destination: {
                            PostPreview(post: post)
                        }, label: {
                            PostPreview(post: post)
                        })
                        //show only searched for posts if searched
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
