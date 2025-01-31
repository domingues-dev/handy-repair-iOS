//
//  ContentView.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 22/01/2025.
//

import SwiftUI
import FirebaseRemoteConfig
import HandyRepairNetwork
import HandyRepairDomain
import HandyRepairUI

struct ContentView: View {
  @Environment(\.authorizationController)
  private var authController
  @State
  private var randomInt: Int = 0
  @RemoteConfigProperty(key: "startupConfig", fallback: StartupConfig())
  var startupConfig
  private let onEvent: (HRAppEvent) async -> Void
  
  init(onEvent: @escaping (HRAppEvent) async -> Void){
    self.onEvent = onEvent
  }
  var body: some View {
    HStack {
      SignInButton {
        let provider: CredentialProvider = authController.performRequest
        await onEvent(.auth(.signInButtonTapped(provider)))
      }
    }
  }
}

#Preview {
  ContentView {
    print(String(reflecting: $0))
  }
}
