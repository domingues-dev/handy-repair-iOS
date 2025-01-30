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
  
  private lazy var authUserProvider: any AuthUserProviderProtocol = AuthUserProvider()
  
  private lazy var signInProvider: any SignInProviderProtocol = SignInProvider(with: authUserProvider)
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

extension HRAppDelegate {
  func signIn(with credentialProvider: @escaping SignInProviderProtocol.CredentialProvider) async -> HRAuthenticationEvent {
    do {
      return try await .didSignIn(with: signInProvider.signIn(with: credentialProvider))
    } catch let error as CancellationError {
      logger.error("Did Cancel Sign In")
      return .didFail(with: error)
    } catch {
      logger.error("Did Fail to Sign In:\n\n\(String(reflecting: error))")
      return .didFail(with: error)
    }
  }
}

extension Logger {
  func critical(_ error: Error) {
    critical("\(String(reflecting: error))")
  }
}
