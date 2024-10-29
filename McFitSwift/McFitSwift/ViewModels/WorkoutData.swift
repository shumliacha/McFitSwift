//
//  WorkoutData.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 22.08.2024.
//

import Foundation

class WorkoutData: ObservableObject { //object with a publisher
    
    @Published var workouts = Workout.morningEasy
    
    //later add methods and stuff
    
    // I should fetch everything using methods indirectly, that's the purpose of class and whole viewmodel
    
}
