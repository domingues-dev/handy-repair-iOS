// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "HandyRepairDomain",
  platforms: [.iOS(.v18)],
  products: [
    .library(
      name: "HandyRepairDomain",
      targets: ["HandyRepairDomain"]),
    .library(
      name: "HandyRepairExtensions",
      targets: ["HandyRepairExtensions"]
    )
  ],
  targets: [
    .target(name: "HandyRepairDomain", dependencies: ["HandyRepairExtensions"]),
    .target(name: "HandyRepairExtensions")
  ]
)
