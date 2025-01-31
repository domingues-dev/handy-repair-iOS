// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HandyRepairUI",
    platforms: [.iOS(.v18)],
    products: [
        .library(name: "HandyRepairUI",targets: ["HandyRepairUI"]),
        .library(name: "HRDesign", targets: ["HRDesign"])
    ],
    targets: [
        .target(name: "HandyRepairUI"),
        .target(name: "HRDesign")
    ]
)
