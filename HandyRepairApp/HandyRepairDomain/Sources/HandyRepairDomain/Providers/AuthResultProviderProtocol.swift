//
//  AuthCredentialProviderProtocol.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 29/01/2025.
//

import Foundation

public protocol AuthCredentialProviderProtocol {
  func performRequest(_ request: AuthRequest) async throws -> AuthCredential
}

public struct AuthRequest: Sendable {
  public var nonce: String?
  public var scope: [AuthScope]?
  
  public init(nonce: String? = nil, scope: [AuthScope]? = nil) {
    self.nonce = nonce
    self.scope = scope
  }
  
  public enum AuthScope: Sendable {
    case fullName
    case email
  }
}
