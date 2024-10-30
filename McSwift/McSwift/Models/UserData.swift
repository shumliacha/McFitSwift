//
//  UserData.swift
//  McSwift
//
//  Created by Kristina Litvinova on 30.10.2024.
//
// TO DO
// add switch statement for courses and/or contracts for additional info on them (like schedule or perks)

import Foundation
import Firebase
import FirebaseAuth

struct UserData: Identifiable, Codable {
    
    var id: UUID
    var firstName: String
    var lastName: String
    var dob: String
    var phone: String
    
    var contract: Contract
    var courses: [Courses?]
    var streak: Int
    
    init(id: UUID, firstName: String, lastName: String, dob: String, phone: String, contract: Contract, courses: [Courses?], streak: Int) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.dob = dob
        self.phone = phone
        self.contract = contract
        self.courses = courses
        self.streak = streak
    }
    
}

enum Contract: String, Codable {
    case basic = "Basic"
    case premium = "Premium"
    case premiumPlus = "Premium+"
}

enum Courses: String, Codable {
    case yoga = "Yoga"
    case pump = "Pump"
    case zumba = "Zumba"
    case pilates = "Pilates"
    case mobility = "Mobility"
    case boxing = "Boxing"
    case step = "Step"
    case sixPack = "Six Pack"
    case dance = "Dance"
    case cycling = "Cycling"
}
