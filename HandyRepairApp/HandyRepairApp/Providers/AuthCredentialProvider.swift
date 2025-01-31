//
//  AuthCredentialProvider.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 29/01/2025.
//

import SwiftUI
import HandyRepairDomain
import AuthenticationServices

extension AuthorizationController: @retroactive AuthCredentialProviderProtocol {
  @Sendable
  public func performRequest(_ request: AuthRequest) async throws -> any HandyRepairDomain.AuthCredential {
    do {
      let requests: [ASAuthorizationRequest] = [request.asASAuthorizationRequest]
      guard case let .appleID(credential) = try await performRequests(requests),
            let idToken = credential.identityToken,
            let idTokenString = String(data: idToken, encoding: .utf8) else {
        throw ASAuthorizationError(.invalidResponse)
      }
      return DefaultAuthCredential(
        idToken: idTokenString,
        rawNonce: request.nonce,
        fullName: credential.fullName
      )
    } catch ASAuthorizationError.canceled {
      throw CancellationError()
    }
  }
}

extension AuthRequest {
  var asASAuthorizationRequest: ASAuthorizationRequest {
    let request = ASAuthorizationAppleIDProvider().createRequest()
    request.nonce = nonce?.sha256
    request.requestedScopes = scope?.compactMap(\.asASAuthorizationScope)
    return request
  }
}

extension AuthRequest.AuthScope {
  var asASAuthorizationScope: ASAuthorization.Scope {
    switch self {
    case .email:
      return .email
    case .fullName:
      return .fullName
    }
  }
}
