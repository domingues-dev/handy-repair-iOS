//
//  RemoteConfigProvider.swift
//  HandyRepairNetwork
//
//  Created by Nicolá Domingues on 24/01/2025.
//

import Foundation
@preconcurrency import FirebaseRemoteConfig
import OSLog

public protocol RemoteConfigProviderProtocol {
  func start() async throws
  init(logger: Logger?)
}

public extension RemoteConfigProviderProtocol {
  init() {
    self.init(logger: nil)
  }
}

private protocol RemoteConfigProviderListenerProtocol {
  func addUpdateListener(_ logger: Logger?)
}

public final class RemoteConfigProvider: RemoteConfigProviderProtocol {
  private let logger: Logger?
  private let remoteConfig: RemoteConfig
  
  public init(logger: Logger? = nil) {
    self.remoteConfig = RemoteConfig.remoteConfig()
    self.logger = logger
    let settings = RemoteConfigSettings()
    #if DEBUG
    settings.minimumFetchInterval = 0
    #endif
    remoteConfig.configSettings = settings
    addUpdateListener(logger)
  }
    
  @MainActor
  public func start() async throws {
    try await remoteConfig.fetchAndActivate()
    logger?.debug("Remote config fetched and activated.")
  }
}

extension RemoteConfigProvider: RemoteConfigProviderListenerProtocol {
  fileprivate func addUpdateListener(_ logger: Logger?) {
    logger?.debug("Remote config update listener started.")
    remoteConfig.addOnConfigUpdateListener { [logger, remoteConfig] update, updateError in
      guard case .none = updateError else {
        logger?.error("Remote config update listener failed with error:\n\n\(String(reflecting: updateError))")
        return
      }
      remoteConfig.activate { [logger, update] changed, error in
        guard case .none = error else {
          logger?.error("Remote config update listener failed with error:\n\n\(String(reflecting: updateError))")
          return
        }
        update?.updatedKeys
          .compactMap { $0 }
          .forEach {
            logger?.info("Remote config update listener updated: \($0, align: .left(columns: 30))")
          }
      }
    }
  }
}

public struct StartupConfig: Decodable, Sendable {
  public let host: URL
  public let path: String
  
  public init?(host: URL? = nil, path: String? = nil) {
    guard let host, let path else { return nil }
    self.host = host
    self.path = path
  }
}
