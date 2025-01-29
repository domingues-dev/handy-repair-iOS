//
//  ContentView.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 22/01/2025.
//

import SwiftUI
import FirebaseRemoteConfig
import HandyRepairNetwork

struct ContentView: View {
  @RemoteConfigProperty(key: "startupConfig", fallback: StartupConfig())
  var startupConfig
  private let signInButton: () -> AnyView
  init(@ViewBuilder signInButton: @escaping () -> AnyView){
    self.signInButton = signInButton
  }
    var body: some View {
      HStack {
        Text("Hello world!")
        Text("Hello world!")
        signInButton()
      }
    }
}

#Preview {
  ContentView(signInButton: { AnyView(EmptyView())})
}
