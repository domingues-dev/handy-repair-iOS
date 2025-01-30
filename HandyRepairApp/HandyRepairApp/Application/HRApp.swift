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
  private var authController
  
  @UIApplicationDelegateAdaptor(HRAppDelegate.self)
  var appDelegate
  
  @State
  private var viewModel = HRAppViewModel()
  
  var body: some Scene {
    WindowGroup {
      ContentView(appEventHandler: contentViewEventHandler)
      .task {
        do {
          try await appDelegate.configProvider.start()
        } catch {
          print(error.localizedDescription)
        }
      }
    }
  }
  
  private func contentViewEventHandler(_ event: HRAppEvent) async {
    if case .authenticationEvent(.signInWithAppleButtonTapped) = event {
      let authEvent = await appDelegate.signIn(with: authController.performRequest)
      viewModel.handleAppEvent(.authenticationEvent(authEvent))
    } else {
      viewModel.handleAppEvent(event)
    }
  }
}
