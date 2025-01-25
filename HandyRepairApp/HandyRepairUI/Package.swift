// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HandyRepairUI",
    platforms: [.iOS(.v18)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "HandyRepairUI",targets: ["HandyRepairUI"]),
        .library(name: "HRAuthUI", targets: ["AuthenticationUI"]),
        .library(name: "HRDesign", targets: ["HRDesign"])
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "HandyRepairUI"),
        .target(name: "AuthenticationUI"),
        .target(name: "HRDesign")
    ]
)
