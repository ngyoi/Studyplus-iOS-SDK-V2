// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "StudyplusSDK_V2",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "StudyplusSDK_V2",
            targets: ["StudyplusSDK_V2"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/kishikawakatsumi/KeychainAccess.git", .exact("3.2.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "StudyplusSDK_V2",
            dependencies: ["KeychainAccess"],
            path: "StudyplusSDK",
            exclude:["StudyplusSDK/Info.plist", "Info.plist"])
    ]
)
