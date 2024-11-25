//
//  PostRow.swift
//  McSwift
//
//  Created by Kristina Litvinova on 20.08.2024.
//

import SwiftUI

struct PostDetail: View {

    var blogPost: BlogPost
            
     var body: some View {
         ScrollView{
             VStack (alignment: .leading){
                            ZStack {
                                Image("testImage")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: .infinity, height: 200, alignment: .center)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 5.5))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5.5)
                                            .stroke(Color.mcsPurple, lineWidth: 6)
                                    )
                                
                                VStack(spacing: 0){
                                    LinearGradient(colors: [Color.init(uiColor: .mcsPurple), Color.clear], startPoint: .bottom, endPoint: .center)
                                        .clipShape(RoundedRectangle(cornerRadius: 5.5))
                                    
                                    Rectangle()
                                        .foregroundStyle(Color.mcsPurple)
                                        .frame(width: .infinity, height: 60, alignment: .center)

                                }
                                
                                
                                
                               /* RoundedRectangle(cornerRadius: 5)
                                    .frame(width: .infinity, height: 200)
                                    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                                    .opacity(0.6)
                                */
                                
                                
                                
                                
                                    
                                
                                VStack (alignment: .leading) {
                                    Spacer()
                                    
                                    Group {
                                        Text(blogPost.title)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundStyle(Color.white)
                                          //  .padding(EdgeInsets(top: 15, leading: 15, bottom: 5, trailing: 0))
                                        
                                        HStack{
                                            Image(systemName: "person.fill")
                                                .font(.caption)
                                                .foregroundStyle(Color.white)
                                            Text("\(blogPost.authorName)")
                                                .font(.caption)
                                                .foregroundStyle(Color.white)
                                            Spacer()
                                            //okay I need to remember how easily dates can be rendered by formatted modifier
                                            Text(blogPost.timestamp.formatted())
                                                .font(.caption)
                                                .foregroundStyle(Color.white)
                                    }
                                      //  .padding(EdgeInsets(top: 0, leading: 15, bottom: 5, trailing: 15))

                                    }
//                                    .padding(10)
//                                    .background(Color.init(uiColor: .mcsPurple).opacity(0.9))
//                                    .cornerRadius(60)
                                    

                                }
                                .padding()
                            }
                            .frame(width: .infinity, height: 200, alignment: .center)
                            .padding(EdgeInsets(top: 5, leading: 17, bottom: 0, trailing: 17))
                 
                 Text(blogPost.text)
                //.padding(25)
                .padding(EdgeInsets(top: 20, leading: 25, bottom: 0, trailing: 25))
                        }
         }
                    
    
        
       // RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
    }
}

#Preview {
    PostDetail(blogPost: BlogPost.testPost)
}

