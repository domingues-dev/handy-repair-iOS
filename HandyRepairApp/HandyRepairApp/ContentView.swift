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
      NavigationStack {
        List {
          if let startupConfig {
            Text(startupConfig.host.absoluteString)
            Text(startupConfig.path)
          }
        }
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button("Crash") {
              let x = [0]
              print(x[1])
            }
          }
        }
      }
    }
}

#Preview {
    ContentView()
}
