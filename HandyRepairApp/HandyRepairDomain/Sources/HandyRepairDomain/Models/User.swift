//
//  User.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 28/01/2025.
//

import Foundation

public struct User: Sendable {
  public let email: String?
  public let isEmailVerified: Bool
  public let isAnonymous: Bool
  public let providerID: String?
//  public let profile: [String: Any]?
  public let isNewUser: Bool?
  public let username: String?
  
  public init(email: String?, isEmailVerified: Bool, isAnonymous: Bool, providerID: String?, isNewUser: Bool?, username: String?) {
    self.email = email
    self.isEmailVerified = isEmailVerified
    self.isAnonymous = isAnonymous
    self.providerID = providerID
    self.isNewUser = isNewUser
    self.username = username
  }
}
