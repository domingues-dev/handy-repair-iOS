//
//  HRAppViewModel.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 29/01/2025.
//

import Observation
import HandyRepairDomain

@Observable
final class HRAppViewModel {
  
  private(set) var isSignedIn: Bool = false
  private(set) var user: AuthUser?
  private(set) var error: Error?
  
  var isAuthenticated: Bool {
    user != nil
  }
  
  func handleAppEvent(_ event: HRAppEvent) {
    switch event {
    case .authenticationEvent(let authEvent):
      handleAuthenticationEvent(authEvent)
    }
  }
  
  private func handleAuthenticationEvent(_ event: HRAuthenticationEvent) {
    switch event {
    case .signInWithAppleButtonTapped:
      break
    case .didSignIn(let user):
      self.user = user
    case .didFail(let error):
      self.error = error
    }
  }
}

enum HRAppEvent: Sendable {
  case authenticationEvent(HRAuthenticationEvent)
}

enum HRAuthenticationEvent: Sendable {
  case signInWithAppleButtonTapped
  case didSignIn(with: AuthUser)
  case didFail(with: Error)
}
