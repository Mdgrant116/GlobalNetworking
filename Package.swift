// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GlobalNetworking",
    platforms: [
        .iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "GlobalNetworking",
            targets: ["GlobalNetworking"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Mdgrant116/FreshLogging", branch: "master"),
        .package(url: "https://github.com/Mdgrant116/FreshNetworking", branch: "master"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "GlobalNetworking",
            dependencies: [
                .product(name: "FreshLogging", package: "FreshLogging"),
                .product(name: "FreshNetworking", package: "FreshNetworking"),
            ]),
        .testTarget(
            name: "GlobalNetworkingTests",
            dependencies: ["GlobalNetworking"]),
    ]
)
