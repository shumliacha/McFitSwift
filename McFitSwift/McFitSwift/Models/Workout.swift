//
//  Workout.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 22.08.2024.
// temp solution, best case: all data stored in firebase

import Foundation

struct Workout: Identifiable, Codable { //uuid and JSON convertions
    //the fuck decoder wants from me??? why does he require decodings everywhere??? why is it not in recipe app????
    var id = UUID()
    
    var exercises: [Exercise : String ]
    //reps can also be made with enum - check out them baby
    
    
}


struct Exercise: Identifiable, Codable, Hashable { //uuid and JSON convertion
    
    var id = UUID()
    
    var name: String
    var description: String
    
    //I REALLY should add photos here! How to manage with codable though????
    
}

extension Workout {
    
    static let morningEasy = Workout(exercises: [
        Exercise(name: "Jumping Jacks", description: "Stand with your feet together and your arms at your sides. \nJump up, spreading your legs out to the sides while raising your arms overhead. \n Jump back to the starting position. \n Continue the movement at a steady pace.") : "1 minute",
        Exercise(name: "Bodyweight Squats", description: "Stand with your feet shoulder-width apart, toes pointing slightly outward. \n Push your hips back as if you’re sitting in a chair, lowering your body until your thighs are parallel to the ground. \n Keep your chest up and your back straight. \n Push through your heels to stand back up.") : "3 sets of 10 reps",
        Exercise(name: "Push-Ups", description: "Start in a plank position with your hands placed slightly wider than shoulder-width apart. \n Keep your body in a straight line from head to heels. \n Lower your body until your chest is just above the ground, then push back up to the starting position. \n If this is too challenging, you can perform the push-ups on your knees.") : "3 sets of 8-10 reps",
        Exercise(name: "Plank", description: "Get into a forearm plank position with your elbows directly under your shoulders. \n Keep your body in a straight line from your head to your heels. \n Engage your core, glutes, and legs to hold the position.") : "3 sets of 20-30 seconds",
        Exercise(name: "Glute Bridges", description: "Lie on your back with your knees bent and feet flat on the floor, hip-width apart. \n Place your arms by your sides, palms facing down. \n Lift your hips towards the ceiling, squeezing your glutes at the top. \n Lower your hips back down to the starting position.") : "3 sets of 12 reps"])
}
