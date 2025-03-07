// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "searchmind",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "searchmind", targets: ["searchmind"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.3.0"),
    ],
    targets: [
        .executableTarget(name: "searchmind", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
        ]),
        .testTarget(name: "CoreTests",
                    dependencies: ["searchmind"]),
        .testTarget(name: "ModelsTests",
                    dependencies: ["searchmind"]),
        .testTarget(name: "UtilitiesTests",
                    dependencies: ["searchmind"]),
    ]
)
