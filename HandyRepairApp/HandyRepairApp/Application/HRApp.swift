//
//  HRApp.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 22/01/2025.
//

import SwiftUI
import AuthenticationServices

@main
struct HRApp: App {
  @Environment(\.authorizationController)
  private var authorizationController
  
  @UIApplicationDelegateAdaptor(HRAppDelegate.self)
  var appDelegate
  
    var body: some Scene {
        WindowGroup {
          ContentView(
            signInButton: signInButton)
            .task {
              do {
                try await appDelegate.configProvider.start()
              } catch {
                print(error.localizedDescription)
              }
            }
        }
    }
  
  private func signInButton() -> AnyView {
    SignInButtonAdapter.make(
      with: authorizationController,
      provider: appDelegate.signInProvider
    )
  }
}
