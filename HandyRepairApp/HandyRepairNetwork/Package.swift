// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "HandyRepairNetwork",
  platforms: [.iOS(.v18)],
  products: [
    // Products define the executables and libraries a package produces, making them visible to other packages.
    .library(
      name: "HandyRepairNetwork",
      targets: ["HandyRepairNetwork"]),
  ],
  dependencies: [
    .package(url: "https://github.com/firebase/firebase-ios-sdk.git", from: "11.7.0"),
    .package(name: "HandyRepairDomain", path: "../HandyRepairDomain")
  ],
  targets: [
    .target(
      name: "HandyRepairNetwork",
      dependencies: [
        "HandyRepairDomain",
        .product(name: "FirebaseRemoteConfig", package: "firebase-ios-sdk"),
        .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
      ]
    )
  ]
)
