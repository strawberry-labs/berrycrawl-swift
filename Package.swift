// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Berrycrawl",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Berrycrawl",
            targets: ["Berrycrawl"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Berrycrawl",
            path: "Sources"
        ),
        .testTarget(
            name: "BerrycrawlTests",
            dependencies: ["Berrycrawl"],
            path: "Tests"
        )
    ]
)
