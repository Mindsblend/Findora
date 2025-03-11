// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "findora",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "findora", targets: ["findora"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
    ],
    targets: [
        .executableTarget(name: "findora", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
        .testTarget(name: "CoreTests",
                    dependencies: ["findora"]),
        .testTarget(name: "ModelsTests",
                    dependencies: ["findora"]),
        .testTarget(name: "UtilitiesTests",
                    dependencies: ["findora"]),
    ]
)
