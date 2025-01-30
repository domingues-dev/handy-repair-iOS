//
//  AuthUserProvider.swift
//  HandyRepairNetwork
//
//  Created by Nicolá Domingues on 25/01/2025.
//

import Foundation
import HandyRepairDomain
@preconcurrency import FirebaseAuth

public final class AuthUserProvider: AuthUserProviderProtocol {
  private let auth: Auth
  
  public init(auth: Auth = .auth()) {
    self.auth = auth
  }
  
  public func signIn(with credential: HandyRepairDomain.AuthCredential) async throws -> AuthUser {
    try await AuthUser(
      auth.signIn(
        with: OAuthProvider.appleCredential(
          withIDToken: credential.idToken,
          rawNonce: credential.rawNonce,
          fullName: credential.fullName
        )
      )
    )
  }
}

extension AuthUser {
  init(_ data: AuthDataResult) {
    self.init(
      email: data.user.email,
      isEmailVerified: data.user.isEmailVerified,
      isAnonymous: data.user.isAnonymous,
      providerID: data.additionalUserInfo?.providerID,
      isNewUser: data.additionalUserInfo?.isNewUser,
      username: data.additionalUserInfo?.username
    )
  }
}
