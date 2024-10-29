//
//  WorkoutListView.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 22.08.2024.
//

import SwiftUI

struct WorkoutListView: View {
    
    @EnvironmentObject private var workout: WorkoutData
    
    @State private var isPresenting = false
    //the fuck do you present??????
    // LATER UNCOMMENT LATER - I just don't understand rn what it wants with from beacause of decodable protocol
    //@State private var newWorkout = Workout()
    
    var body: some View {
        NavigationStack {
            
        }
    }
}

#Preview {
    WorkoutListView()
}
