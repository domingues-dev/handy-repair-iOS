//
//  ContentView.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 22/01/2025.
//

import SwiftUI
import FirebaseRemoteConfig
import HandyRepairNetwork
import HandyRepairUI

struct ContentView: View {
  @RemoteConfigProperty(key: "startupConfig", fallback: StartupConfig())
  var startupConfig
  private let appEventHandler: (HRAppEvent) async -> Void
  
  init(appEventHandler: @escaping (HRAppEvent) async -> Void){
    self.appEventHandler = appEventHandler
  }
    var body: some View {
      HStack {
        SignInButton {
          await appEventHandler(.authenticationEvent(.signInWithAppleButtonTapped))
        }
      }
    }
}

#Preview {
  ContentView {
    print(String(reflecting: $0))
  }
}
