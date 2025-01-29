//
//  SignInButtonAdapter.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 28/01/2025.
//

import SwiftUI
import HandyRepairUI
import HandyRepairDomain
import HandyRepairNetwork
import AuthenticationServices
import HandyRepairExtensions

enum SignInButtonAdapter {
  static func make(
    with controller: AuthorizationController,
    provider: any SignInProviderProtocol
  ) -> AnyView {

    return AnyView(SignInButton {
      Task {
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
    )
  }
}
