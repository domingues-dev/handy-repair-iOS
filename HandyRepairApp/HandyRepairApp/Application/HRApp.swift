//
//  HRApp.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 22/01/2025.
//

import SwiftUI
import AuthenticationServices
import FirebaseCore

@main
struct HRApp: App {
  @Environment(\.authorizationController)
  private var authController
  
  @UIApplicationDelegateAdaptor(HRAppDelegate.self)
  var appDelegate
  
  @State
  private var viewModel: HRAppViewModel
  
  init() {
    FirebaseApp.configure()
    self.viewModel = HRAppViewModel()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView(onEvent: viewModel.handleAppEvent)
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
