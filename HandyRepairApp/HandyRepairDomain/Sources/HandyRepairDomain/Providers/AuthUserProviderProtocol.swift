//
//  AuthUserProviderProtocol.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 28/01/2025.
//

import Foundation

public protocol AuthUserProviderProtocol {
  func signIn(with credential: AuthCredential) async throws -> AuthUser
}
