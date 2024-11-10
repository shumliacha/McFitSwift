//
//  MainTabView.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//
// TO DO
//
// find out how to manage different versions and use it here for tabs

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            PostsListView()
                .tabItem {
                    Label("Blog", systemImage: "lightbulb")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
            
            
            
            
//  FOR IOS 18 +
//            Tab("Blog", systemImage: "lightbulb") {
//                PostsList()
//            }
//
//
//            Tab("Home", systemImage: "house"){
//                HomeView()
//            }
//
//            Tab("Profile", systemImage: "person.crop.circle") {
//                HomeView()
//            }
                
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .toolbarBackground(Color(.systemBackgroundWhite), for: .bottomBar)
        .toolbarBackground(.visible, for: .bottomBar)
            
            
        
    }
}

#Preview {
    MainTabView()
}
