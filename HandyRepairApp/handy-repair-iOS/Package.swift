// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "handy-repair-iOS",
  defaultLocalization: "en",
  platforms: [.iOS(.v18)],
  products: [
    .library(
      name: "Authentication",
      targets: ["Authentication"]),
  ],
  dependencies: [
  ],
  targets: [
    .target(
      name: "Authentication"
    )
  ]
)
