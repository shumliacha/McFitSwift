//
//  ContentView.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 17.08.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
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
                .frame(width:360)
                .backgroundStyle(Color.init(uiColor: .systemGray6))
                
                GroupBox {
                        VStack(alignment: .leading){
                            Label("Courses", systemImage: "figure.mind.and.body")
                                .font(.title3.bold())
                                .foregroundColor(.cyan)
                        }
                    HStack{//This needs to be connected to a model, just a placeholder for now. Also has to lead to child view of full schedule
                        
                        
                    }
                    .padding(7)
                }
                .frame(idealWidth: 360)
                .backgroundStyle(Color.init(uiColor: .systemGray6))
                
            }
        }
    }
}

#Preview {
    HomeView()
}
