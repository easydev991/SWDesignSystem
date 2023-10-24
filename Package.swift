// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SWDesignSystem",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "SWDesignSystem", targets: ["SWDesignSystem"])
    ],
    dependencies: [
        .package(url: "https://github.com/OlegEremenko991/CachedAsyncImage991", from: "1.0.4")
    ],
    targets: [
        .target(
            name: "SWDesignSystem",
            dependencies: [
                .product(name: "CachedAsyncImage991", package: "CachedAsyncImage991")
            ]
        )
    ]
)
