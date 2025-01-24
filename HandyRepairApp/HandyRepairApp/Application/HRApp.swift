//
//  HRApp.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 22/01/2025.
//

import SwiftUI
import HandyRepairNetwork
import Firebase

@main
struct HRApp: App {
  @UIApplicationDelegateAdaptor(HRAppDelegate.self)
  var appDelegate
  
    var body: some Scene {
        WindowGroup {
          ContentView()
            .task {
              do {
                try await appDelegate.configProvider.start()
              } catch {
                print(error.localizedDescription)
              }
            }
        }
    }
}
