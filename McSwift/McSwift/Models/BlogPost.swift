//
//  BlogPost.swift
//  McSwift
//
//  Created by Kristina Litvinova on 19.08.2024.

//Really like this way of doing the model, but to prefer the firebase connection I need to simplify it. Would work nicely with CoreData though

import Foundation
import SwiftUI
import Firebase

struct BlogPost: Identifiable, Codable, Equatable, Hashable { //for uuid for lists and foreach, for urls
    var title: String
    var authorName: String
    //var banner: String //leave out for now, I need to add async await and main actor for it
    var timestamp = Date()
    //ver 2
    var text: String
    var tags: Tags
    
    //ver 1
//    var content: BlogContent
//    var tags: Tags
    
    var id: UUID //will create uuid each time a new struct is created, the same format as in database
    
    //Ver 1
    
//    init(title: String, authorName: String, timestamp: Date = Date(), content: BlogContent, tags: Tags, id: UUID = UUID()) {
//        self.title = title
//        self.authorName = authorName
//        self.timestamp = timestamp
//        self.content = content
//        self.tags = tags
//        self.id = id
//    }
    
    // ver 2
    init(title: String, authorName: String, timestamp: Date = Date(), text: String, id: UUID, tags: Tags) {
        self.title = title
        self.authorName = authorName
        self.timestamp = timestamp
        self.text = text
        self.id = id
        self.tags = tags
    }
    
    //ver 1
//    func contains(_ string: String) -> Bool {
//           let properties = [title, authorName, content.intro, content.text1] // content.text2, content.text3, content.text4, content.text5]
//           let matches = properties.filter{$0.contains(string)} // THIS IS PROBLEMATIC, JUST A TEMP SOLUTION
//
//           return !matches.isEmpty
//       }
    
    //ver 2
    func contains(_ string: String) -> Bool {
           let properties = [title, authorName, text]
           let matches = properties.filter{$0.contains(string)} // THIS IS PROBLEMATIC, JUST A TEMP SOLUTION
           
           return !matches.isEmpty
       }
}

//ver 1

//struct BlogContent: Codable {
//    var intro: String //add divider after an intro
//    var text1: String
//    var text2: String?
//    var text3: String?
//    var text4: String?
//    var text5: String?
//    
//    var photo1: String? //fetch urls, convert to images later
//    var photo2: String?
//    var photo3: String?
//    var photo4: String?
//}


enum Tags: Codable {
    case nutrition
    case mentalHealth
    case coachAdvice
    case weeklyMusic
    case updates
    case thoughts
    
    var info: (name: String, color: Color) {
        switch self {
        case .nutrition:
            return ("Nutrition", Color.green)
        case .mentalHealth:
            return ("Mental Health", Color.blue)
        case .coachAdvice:
            return ("Coach Advice", Color.init(uiColor: .mcsPurple))
        case .updates:
            return ("Updates", Color.red)
        case .weeklyMusic:
            return ("Weekly Playlist", Color.teal)
        case .thoughts:
            return ("Thoughts", Color.yellow)
                }
    }
    // access like this let errorCode = myErrorType.info.code
    
    
}


//ver 1

//placeholder post for testing purposes
//extension BlogPost {
//    static let testPost = BlogPost(title: "Warming Up on Monday", authorName: "Samantha"/*, banner: "https://source.unsplash.com/gJtDg6WfMlQ/500x1200"*/, content: BlogContent(intro: "Hey guys! \n\nHow have you all been lately? Let's plan an easy warm up for the start of the week.", text1: "Warm-Up (5 minutes) \n\n1. March in Place - 2 minutes \n Lift your knees high and swing your arms as you march in place. \n\n2. Arm Circles - 1 minute \n Extend your arms out to the sides and make small circles, gradually increasing the size. Do 30 seconds forward and 30 seconds backward. \n\n3. Leg Swings - 1 minute \n Stand on one leg and gently swing the other leg forward and backward. Do 30 seconds on each leg. \n\n4. Torso Twists - 1 minute \n Stand with feet shoulder-width apart and twist your torso side to side, gently warming up your spine. \n\nTips: \nStay Hydrated: Drink water before, during, and after your workout. \nListen to Your Body: If something feels too difficult, reduce the reps or modify the exercise. \nConsistency: Aim to do this routine 3-4 times a week for best results. \n\nEnjoy your workout!"), tags: Tags.coachAdvice)
//}

//ver 2

extension BlogPost {
    static let testPost = BlogPost(title: "Warming Up on Monday", authorName: "Samantha"/*, banner: "https://source.unsplash.com/gJtDg6WfMlQ/500x1200"*/, text: "Hey guys! \n\nHow have you all been lately? Let's plan an easy warm up for the start of the week. \n\n Warm-Up (5 minutes) \n\n1. March in Place - 2 minutes \n Lift your knees high and swing your arms as you march in place. \n\n2. Arm Circles - 1 minute \n Extend your arms out to the sides and make small circles, gradually increasing the size. Do 30 seconds forward and 30 seconds backward. \n\n3. Leg Swings - 1 minute \n Stand on one leg and gently swing the other leg forward and backward. Do 30 seconds on each leg. \n\n4. Torso Twists - 1 minute \n Stand with feet shoulder-width apart and twist your torso side to side, gently warming up your spine. \n\nTips: \nStay Hydrated: Drink water before, during, and after your workout. \nListen to Your Body: If something feels too difficult, reduce the reps or modify the exercise. \nConsistency: Aim to do this routine 3-4 times a week for best results. \n\nEnjoy your workout!", id: UUID(), tags: Tags.coachAdvice)
}
