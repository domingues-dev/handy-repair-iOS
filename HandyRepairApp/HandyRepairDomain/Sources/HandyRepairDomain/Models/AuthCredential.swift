//
//  AuthCredential.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 28/01/2025.
//

import Foundation

public protocol AuthCredential: Sendable {
  var idToken: String { get }
  var rawNonce: String? { get }
  var fullName: PersonNameComponents? { get }
}

public struct DefaultAuthCredential: AuthCredential {
  public let idToken: String
  public let rawNonce: String?
  public let fullName: PersonNameComponents?
  
  public init(idToken: String, rawNonce: String?, fullName: PersonNameComponents?) {
    self.idToken = idToken
    self.rawNonce = rawNonce
    self.fullName = fullName
  }
}
