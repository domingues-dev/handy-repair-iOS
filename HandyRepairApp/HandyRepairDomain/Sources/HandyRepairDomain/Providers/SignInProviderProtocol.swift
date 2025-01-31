//
//  SignInProviderProtocol.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 29/01/2025.
//

import Foundation

public typealias CredentialProvider = @Sendable (AuthRequest) async throws -> any AuthCredential
public protocol SignInProviderProtocol {

  func signIn(with credentialProvider: @escaping CredentialProvider) async throws -> AuthUser
}
