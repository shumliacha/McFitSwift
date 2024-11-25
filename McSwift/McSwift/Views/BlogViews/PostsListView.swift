//
//  PostsList.swift
//  McSwift
//
//  Created by Kristina Litvinova on 18.08.2024.


// TO DO
// open keyboard when pressed on it
// link works but ui does not
// ADD GRADIENT LIKE IN HOME VIEW


import SwiftUI

struct PostsListView: View {
    
    
    @StateObject var viewModel = BlogDataViewModel()
    
    //search
    @State private var searchText = ""
    
     var body: some View {
         ZStack (alignment: .top){
             
             RadialGradient(colors: [Color.mcsDarkPurple, Color.init(uiColor: .systemGray4)], center: .topLeading, startRadius: 1, endRadius: 735)
                 .opacity(0.30)
                 .ignoresSafeArea()

             // DOESN'T WORKKKK
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
                                title: "Empty 😔",
                                message: "There are no posts in the Blog yet."
                             )
                             
                         case let .loaded(posts):
                             List(posts) { post in
                                 if searchText.isEmpty || post.contains(searchText) {
                                     NavigationLink(destination: PostDetail(blogPost: post)) {
                                         PostPreview(viewModel: viewModel.makeBlogPostViewModel(for: post))
                                     }
                                 }
                             }
                             .searchable(text: $searchText)
                         }
                     }
                 
                 .navigationTitle("Blog")
             }
             .onAppear {
                 viewModel.fetchPosts()
             }
         }
        
         // RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
    }
}

#if DEBUG
struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        ListPreview(state: .loaded([BlogPost.testPost]))
        ListPreview(state: .empty)
        ListPreview(state: .error)
        ListPreview(state: .loading)
    }
    
    @MainActor
    private struct ListPreview: View {
        let state: Loadable<[BlogPost]>
        
        var body: some View {
            let postsRepository = BlogRepositoryStub(state: state)
            let viewModel = BlogPostViewModel(blogPost: BlogPost.testPost)
            PostPreview(viewModel: viewModel)
        }
    }
}
#endif
