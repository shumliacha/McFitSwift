//
//  PostPreview.swift
//  McSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
//


import SwiftUI

struct PostPreview: View {
    
    @ObservedObject var viewModel: BlogPostViewModel
    
    //try to create some custom modifiers to lighten up code, maube combined with PostRow ones
    
    var body: some View {
                HStack{
                    Image("testImage")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80,height: 55, alignment: .center)
                        .scaledToFit()
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 5.5))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                    
                    VStack(alignment: .leading) {
                                        
                        Text(viewModel.blogPost.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                        .padding(EdgeInsets(top: 5, leading: 0, bottom: 7, trailing: 0))
                        
                        HStack {
                            
                            Image(systemName: "person.fill")
                                .font(.caption)
                                .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                                                 
                            Text("\(viewModel.authorName)")
                                .font(.caption)
                                .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                            Spacer()
                            //okay I need to remember how easily dates can be rendered by formatted modifier
                            Text(viewModel.timestamp.formatted())
                                .font(.caption)
                                .foregroundStyle(Color.init(uiColor: .systemTextBlack))
                        }
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 3, trailing: 0))
                    }
                   
                }
    }
    
}

#Preview {
    PostPreview(viewModel: BlogPostViewModel(blogPost: BlogPost.testPost) )
}
