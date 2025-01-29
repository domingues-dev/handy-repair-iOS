//
//  Strings+RandomNonce.swift
//  HandyRepairDomain
//
//  Created by Nicolá Domingues on 28/01/2025.
//

import Foundation

public extension String {
  static func randomNonce(length: Int = 32) throws -> String {
    precondition(length > 0)
    var randomBytes: [UInt8] = .init(repeating: 0, count: length)
    guard case errSecSuccess = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes) else {
      throw RandomNonceGenerationError()
    }
    return .nonce(randomBytes)
  }
}

private struct RandomNonceGenerationError: Error {}

private extension String {
  static func nonce(_ randomBytes: [UInt8]) -> String {
    let set: [Character] = .nonceAllowedCharacters
    let nonce = randomBytes.map { byte in
      set[Int(byte) % set.count]
    }
    return String(nonce)
  }
}

private extension Array where Element == Character {
  static let nonceAllowedCharacters: Self = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
}
