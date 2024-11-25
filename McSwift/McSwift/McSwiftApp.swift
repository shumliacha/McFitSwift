//
//  McSwiftApp.swift
//  McSwift
//
//  Created by Kristina Litvinova on 17.08.2024.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
// i am almost sure it shouldn't return true all the time
    return true
  }
}

@main
struct McSwiftApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//OR
//init() {FirebaseApp.configure()}

  var body: some Scene {
    WindowGroup {
        AuthView()
    }
  }
}
