// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Falu",
    platforms: [.iOS(.v13),
                .macOS(.v10_15),
                .tvOS(.v13),
                .watchOS(.v6)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Falu",
            targets: ["Falu"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "TingleApiClient" ,url: "https://github.com/tinglesoftware/swift-apiclients.git", .exact("1.0.0")),
        .package(url: "Mocker","https://github.com/WeTransfer/Mocker.git", .exact("2.3.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Falu",
            dependencies: ["TingleApiClient", "Mocker"]),
        .testTarget(
            name: "FaluTests",
            dependencies: ["Falu"]),
    ]
)
