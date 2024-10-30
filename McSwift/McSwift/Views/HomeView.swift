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
            ZStack (alignment: .top){
                
                RadialGradient(colors: [Color.mcsPurple, Color.init(uiColor: .systemGray4)], center: .topLeading, startRadius: 1, endRadius: 735)
                    .ignoresSafeArea()
                    .opacity(0.50)
                
                
                VStack {
                    
                    BoxView(label: "Week Streak", icon: "flame", additional: "Reactive", accentColor: .red) {
                        
                    }
                    
                    BoxView(label: "Courses", icon: "figure.mind.and.body", additional: "Reactive", accentColor: .cyan) {
                        
                        VStack{//This needs to be connected to a model, just a placeholder for now. Also has to lead to child view of full schedule
                            ForEach(todayCourses, id: \.self) {course in
                                HStack{
                                    
                                    Text("• " + course)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            
                        }
                        .padding(5)
                    }
                    
                    BoxView(label: "Name", icon: "square.and.arrow.up.fill", additional: "8", accentColor: .brown) {
                        
                    }
                    
                }
                .navigationTitle("Home")
            }
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

private struct BoxView<Content: View>: View {
    
    var label: String
    var icon: String
    var additional: String
    var accentColor: Color
    @ViewBuilder let content: () -> Content
     
    var body: some View {
        
        GroupBox {
            HStack{
                Label(label, systemImage: icon)
                    .font(.title3.bold())
                    .foregroundColor(accentColor)
                Spacer()
                Text(additional)
                    .font(.title3)
            }
            .padding(7)
            
            content()
        }
        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
        .backgroundStyle(Color.init(uiColor: .systemBackgroundWhite))
    }
}

#Preview {
    HomeView()
}
