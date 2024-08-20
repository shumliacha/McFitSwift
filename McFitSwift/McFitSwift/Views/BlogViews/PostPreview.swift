//
//  PostPreview.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
//
//USED TO FORMAT POSTS IN LIST GRACIFULLY, this preview kinda sucks because it's literally made for Lists and it's too complicated to create  List preview :(

import SwiftUI

struct PostPreview: View {
    
    let post: BlogPost
    
    var body: some View {
            VStack(alignment: .leading) {
                Spacer()
                Text(post.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                //.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                HStack {
                    Image(systemName: "person.fill")
                        .font(.caption)
                        .foregroundStyle(Color.white)
                    Text(post.authorName)
                        .font(.caption)
                        .foregroundStyle(Color.white)
                    Spacer()
                    //okay I need to remember how easily dates can be rendered by formatted modifier
                    Text(post.timestamp.formatted())
                        .font(.caption)
                        .foregroundStyle(Color.white)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
            }
            .listRowBackground(ZStack{
                Image("testImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .infinity, height: 200, alignment: .center)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 5.5))
                    //.backgroundStyle(Color.black)
                    //.opacity(0.3)
                
                LinearGradient(colors: [post.tags.info.color, Color.clear], startPoint: .bottom, endPoint: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 5.5))
            })
    }
}

#Preview {
        PostPreview(post: BlogPost.testPost)
}
