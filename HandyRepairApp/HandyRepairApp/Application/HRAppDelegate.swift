//
//  HRAppDelegate.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 23/01/2025.
//

import SwiftUI
import Firebase
import HandyRepairNetwork
import HandyRepairDomain
import OSLog

final class HRAppDelegate: NSObject, UIApplicationDelegate {
  
  private lazy var logger = Logger(subsystem: HRAppDelegate.description(), category: "main")
  
  lazy var configProvider: any RemoteConfigProviderProtocol = RemoteConfigProvider(logger: logger)
  
  lazy var signInProvider: any SignInProviderProtocol = SignInProvider()
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

extension Logger {
  func critical(_ error: Error) {
    critical("\(String(reflecting: error))")
  }
}
