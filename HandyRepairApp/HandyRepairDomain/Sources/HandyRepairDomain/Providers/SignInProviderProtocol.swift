//
//  SignInProviderProtocol.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 29/01/2025.
//

import Foundation

public protocol SignInProviderProtocol {
  typealias CredentialProvider = (AuthRequest) async throws -> any AuthCredential

  func signIn(with credentialProvider: @escaping CredentialProvider) async throws -> AuthUser
}
