//
//  McFitSwiftApp.swift
//  McFitSwift
//
//  Created by Kristina Litvinova on 17.08.2024.
//

import SwiftUI
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct YourApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


  var body: some Scene {
    WindowGroup {
     // NavigationView {
        //HomeView()
          PostsList()
      //jhbgvgbhnjdd}
    }
  }
}
