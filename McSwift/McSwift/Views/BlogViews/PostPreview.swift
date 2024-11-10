//
//  PostPreview.swift
//  McSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
//


import SwiftUI

struct PostPreview: View {
    
    @ObservedObject var viewModel: BlogPostViewModel

//    var post = BlogPost.testPost //for tsting only
    
    //try to create some custom modifiers to lighten up code, maube combined with PostRow ones
    
    var body: some View {
        
            VStack(alignment: .leading) {
                
                Spacer()
                
                Text(viewModel.blogPost.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                //.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                HStack {
                    
                    Image(systemName: "person.fill")
                        .font(.caption)
                        .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                                         
                    Text("\(viewModel.authorName) for \(viewModel.tags.info.name)")
                        .font(.caption)
                        .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                    Spacer()
                    //okay I need to remember how easily dates can be rendered by formatted modifier
                    Text(viewModel.timestamp.formatted())
                        .font(.caption)
                        .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
    }
    
}

//#Preview {
//    PostPreview(post: BlogPost.testPost)
//}
