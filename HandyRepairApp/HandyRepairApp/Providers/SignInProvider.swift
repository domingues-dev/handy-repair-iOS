//
//  SignInProvider.swift
//  HandyRepairApp
//
//  Created by Nicolá Domingues on 28/01/2025.
//

import HandyRepairDomain
import HandyRepairExtensions

final class SignInProvider: SignInProviderProtocol {
  private let authUserProvider: any AuthUserProviderProtocol
  
  init(with authUserProvider: any AuthUserProviderProtocol) {
    self.authUserProvider = authUserProvider
  }
  
  func signIn(with credentialProvider: @escaping CredentialProvider) async throws -> AuthUser {
    let request = try AuthRequest(nonce: .randomNonce(), scope: [.email, .fullName])
    let credential = try await credentialProvider(request)
    return try await authUserProvider.signIn(with: credential)
  }
}
