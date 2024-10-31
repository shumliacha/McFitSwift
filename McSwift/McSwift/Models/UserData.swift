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

struct UserData: Codable {
    
    var email: String
    var uid: String
    var firstName: String
    var lastName: String
    var dob: String
    var phone: String
    
    var contract: Contract
    var courses: [Courses?]
    var streak: Int
    
    
    init(dictionary: [String: Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.firstName = dictionary["firstname"] as? String ?? ""
        self.lastName = dictionary["lastname"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.contract = dictionary["contract"] as? Contract ?? Contract.basic
        self.courses = dictionary["courses"] as? [Courses?] ?? [Courses]()
        self.dob = dictionary["courses"] as? String ?? ""
        self.streak = dictionary["streak"] as? Int ?? 0
        self.phone = dictionary["phone"] as? String ?? ""
        
        
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
