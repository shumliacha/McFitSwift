//
//  BlogPost.swift
//  McSwift
//
//  Created by Kristina Litvinova on 19.08.2024.


import Foundation
import SwiftUI
import Firebase

struct BlogPost: Identifiable, Codable, Equatable, Hashable { //for uuid for lists and foreach, for urls
    var title: String
    var authorName: String
    var timestamp: Date
    var text: String
    
    var id: UUID //will create uuid each time a new struct is created, the same format as in database
    
    init(title: String, authorName: String, timestamp: Date = Date(), text: String, id: UUID) {
        self.title = title
        self.authorName = authorName
        self.timestamp = timestamp
        self.text = text
        self.id = id
    }
    
    func contains(_ string: String) -> Bool {
           let properties = [title, authorName, text]
           let matches = properties.filter{$0.contains(string)}
           
           return !matches.isEmpty
       }

}


extension BlogPost {
    static let testPost = BlogPost(title: "Warming Up on Monday", authorName: "Samantha", timestamp: Date(), text: """
Hey guys!
\n\nHow have you all been lately? Let's plan an easy warm up for the start of the week. 

\n\n Warm-Up (5 minutes) \n\n1. March in Place - 2 minutes 
\n Lift your knees high and swing your arms as you march in place. 

\n\n2. Arm Circles - 1 minute 
\n Extend your arms out to the sides and make small circles, gradually increasing the size. Do 30 seconds forward and 30 seconds backward. 

\n\n3. Leg Swings - 1 minute 
\n Stand on one leg and gently swing the other leg forward and backward. Do 30 seconds on each leg. 

\n\n4. Torso Twists - 1 minute 
\n Stand with feet shoulder-width apart and twist your torso side to side, gently warming up your spine. 

\n\nTips: 
\nStay Hydrated: Drink water before, during, and after your workout. 
\nListen to Your Body: If something feels too difficult, reduce the reps or modify the exercise. 
\nConsistency: Aim to do this routine 3-4 times a week for best results. 

\n\nEnjoy your workout!
""", id: UUID())
}
