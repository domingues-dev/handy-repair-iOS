//
//  SignInProvider.swift
//  HandyRepairNetwork
//
//  Created by Nicolá Domingues on 25/01/2025.
//

import Foundation
import HandyRepairDomain
@preconcurrency import FirebaseAuth

public typealias HandyRepairUser = HandyRepairDomain.User

public final class SignInProvider: SignInProviderProtocol {
  private let auth: Auth
  
  public init(auth: Auth = .auth()) {
    self.auth = auth
  }
  
  @MainActor
  public func signIn(with credential: HandyRepairDomain.AuthCredential) async throws -> HandyRepairUser {
    try await User(
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

extension HandyRepairUser {
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
