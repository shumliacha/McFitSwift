//
//  PostRow.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
//

import SwiftUI

struct PostRow: View {
    
    let post: BlogPost
    //GIRL WHAT ARE YOU DOING
        
    //Custom modifier for different views - grid or list
    //make this a supporting view to use in lists and grids
     var body: some View {
         VStack (alignment: .leading){
                        ZStack {
                            Image("testImage")
                                .resizable()
                                .scaledToFill()
                                .frame(width: .infinity, height: 200, alignment: .center)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 5.5))
                                .backgroundStyle(Color.black)
                                //.opacity(0.3)
                            
                            LinearGradient(colors: [post.tags.info.color, Color.clear], startPoint: .bottom, endPoint: .top)
                                .clipShape(RoundedRectangle(cornerRadius: 5.5))
                            
                            
                           /* RoundedRectangle(cornerRadius: 5)
                                .frame(width: .infinity, height: 200)
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                                .opacity(0.6)
                            */
                            
                            
                                
                            
                            VStack (alignment: .leading) {
                                Text(post.title)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color.white)
                                    .padding(EdgeInsets(top: 125, leading: 15, bottom: 5, trailing: 0))
                                HStack{
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
                                .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))
                            }
                        }
                        .frame(width: .infinity, height: 200, alignment: .center)
                        .padding(EdgeInsets(top: 0, leading: 17, bottom: 0, trailing: 17))
             
             GroupBox{
                 HStack{
                     
                     Text(post.content.intro)
                 }
             }
             .frame(maxWidth: .infinity, alignment: .center)
                        Text(post.content.text1)
            //.padding(25)
            .padding(EdgeInsets(top: 100, leading: 25, bottom: 0, trailing: 25))
                    }
                    
    
        
       // RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
    }
}

#Preview {
    PostRow(post: BlogPost.testPost)
}

