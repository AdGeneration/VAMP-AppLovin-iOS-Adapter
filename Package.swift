// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VAMP-AppLovin-iOS-Adapter",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "VAMPAppLovinAdapter",
            targets: ["VAMPAppLovinAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/VAMP-iOS-SDK",
            "5.3.2"..<"6.0.0"
        ),
        .package(
            url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
            exact: "13.3.1"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "VAMPAppLovinAdapterTarget",
            dependencies: [
                .target(name: "VAMPAppLovinAdapter"),
                .product(name: "VAMP", package: "VAMP-iOS-SDK"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package")
            ],
            path: "VAMPAppLovinAdapterTarget"
        ),
        .binaryTarget(name: "VAMPAppLovinAdapter",
                      url: "https://d2dylwb3shzel1.cloudfront.net/iOS/VAMPAppLovinAdapter-v13.3.100.zip",
                      checksum: "d11d7067a24d761c7fdb586f5da88a2cae3626684d04c148a513ad4c49c016f5")
    ]
)
