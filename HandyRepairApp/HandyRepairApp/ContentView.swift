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
  
  init(){}
    var body: some View {
      List {
        if let startupConfig {
          Text(startupConfig.host.absoluteString)
          Text(startupConfig.path)
        }
      }
    }
}

#Preview {
    ContentView()
}
