//
//  SignInButtonViewModel.swift
//  handy-repair-iOS
//
//  Created by Nicolá Domingues on 27/01/2025.
//

import Foundation
import Observation
import SwiftUI
import AuthenticationServices
import HandyRepairDomain
import HandyRepairExtensions

@Observable
public final class SignInButtonViewModel {
  let provider: any SignInProviderProtocol
  
  public init(provider: any SignInProviderProtocol) {
    self.provider = provider
  }
  
  @MainActor
  func signInWithApple(_ controller: AuthorizationController) async {
    do {
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.email, .fullName]
      let rawNonce: String = try .randomNonce()
      request.nonce = rawNonce.sha256
      
      guard case let .appleID(credential) = try await controller.performRequests([request]),
            let idToken = credential.identityToken,
            let idTokenString = String(data: idToken, encoding: .utf8) else {
        throw ASAuthorizationError(.invalidResponse)
      }
      
      let user = try await provider.signIn(
        with: DefaultAuthCredential(
          idToken: idTokenString,
          rawNonce: rawNonce,
          fullName: credential.fullName
        )
      )
      print(String(reflecting: user))
    } catch {
      print(String(reflecting: error))
    }
  }
}
