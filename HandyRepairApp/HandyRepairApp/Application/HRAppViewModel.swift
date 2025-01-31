//
//  HRAppViewModel.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 29/01/2025.
//

import Observation
import HandyRepairDomain
import HandyRepairNetwork
import OSLog

@Observable
final class HRAppViewModel {
  private let logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: #fileID)
  private let signInProvider: any SignInProviderProtocol
  private(set) var isSignedIn: Bool = false
  private(set) var user: AuthUser?
  private(set) var error: Error?
  
  init(authUserProvider: any AuthUserProviderProtocol = AuthUserProvider()) {
    self.signInProvider = SignInProvider(with: authUserProvider)
  }
  
  var isAuthenticated: Bool {
    user != nil
  }
  
  func handleAppEvent(_ event: HRAppEvent) async {
    switch event {
    case .auth(let authEvent):
      await handleAuthenticationEvent(authEvent)
    }
  }
  
  private func handleAuthenticationEvent(_ event: HRAuthenticationEvent) async {
    switch event {
    case let .signInButtonTapped(credentialProvider):
      await signIn(with: credentialProvider)
    }
  }
  
  func signIn(with credentialProvider: @escaping CredentialProvider) async {
    do {
      self.user = try await signInProvider.signIn(with: credentialProvider)
    } catch is CancellationError {
      logger.error("Did Cancel Sign In")
    } catch {
      logger.error("Did Fail to Sign In:\n\n\(String(reflecting: error))")
      self.error = error
    }
  }
}

enum HRAppEvent: Sendable {
  case auth(HRAuthenticationEvent)
}

enum HRAuthenticationEvent: Sendable {
  case signInButtonTapped(CredentialProvider)
}
