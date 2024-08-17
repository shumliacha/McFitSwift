//
//  LaunchScreen.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 17.08.2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack{
            RadialGradient(colors: [Color.mcsPurple, Color.mcsDarkPurple], center: .topLeading, startRadius: -150, endRadius: 900)                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("AppIconM")
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text("McFitSwift")
                    .font(.title3.bold())
                    .foregroundStyle(Color.white)
                RoundedRectangle(cornerSize: CGSize(width: 15, height: 15), style: .continuous)
                    .fill(Color.mcsBG)
                    .frame(width: 350, height: 150)
                Spacer()
                Spacer()
                Text("Developed by shumliacha")
                    .font(.callout)
                    .foregroundStyle(Color.mcsPurple)
                    }
        }
    }
}

#Preview {
    HomeScreen()
}
