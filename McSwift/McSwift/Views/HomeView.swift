//
//  HomeView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 17.08.2024.
//

import SwiftUI

struct HomeView: View {
    
    let todayCourses = ["Yoga", "Boxing"]
    
    var body: some View {
        NavigationStack {
            ZStack{
                
                RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: 1, endRadius: 735)
                    .ignoresSafeArea()
                
                
                VStack {
                    GroupBox {
                        HStack{//Better to create custom card view, avoid repetitions
                            Label("Week Streak", systemImage: "flame")
                                .font(.title3.bold())
                                .foregroundColor(.red)
                            Spacer()
                            Text("9")
                                .font(.title.bold())
                        }
                        .padding(7)
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .backgroundStyle(Color.init(uiColor: .systemGray6))
                    
                    GroupBox {
                        VStack(alignment: .leading){
                            HStack{
                                Label("Courses", systemImage: "figure.mind.and.body")
                                    .font(.title3.bold())
                                    .foregroundColor(.cyan)
                                Spacer()
                                Text("Monday")
                                    .font(.callout)
                            }
                            
                            VStack{//This needs to be connected to a model, just a placeholder for now. Also has to lead to child view of full schedule
                                ForEach(todayCourses, id: \.self) {course in
                                    HStack{
                                        
                                        Text("●" + course)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                
                            }
                            .padding(7)
                        }
                    }
                    .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
                    .backgroundStyle(Color.init(uiColor: .systemGray6))
                    
                }
                .navigationTitle("Screen Background")
                
                
            }
            //.navigationBarTitleDisplayMode(.inline)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HomeView()
}
