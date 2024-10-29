//
//  WorkoutGridView.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 22.08.2024.
//


/*
 
 CHANGE OF PLANS
 
 lets do all workouts as a list and exercises as a grid????
 
 */
import SwiftUI

struct WorkoutGridView: View {
    
    @EnvironmentObject private var workoutData: WorkoutData
    //instance of viewmodel class
    //we used stateobj and published in class definition and environment object in its iteration????
    
    let columns = [GridItem(), GridItem()]
    
    var body: some View {
        
        //let columns = [GridItem(), GridItem()]
        //WHY TF IN THE FRICKING VIEW??????
        
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns, content: {
                  //  ForEach
                    Text("Placeholder gy")
                })
            
            }
        }
    }
}

#Preview {
    WorkoutGridView()
}
