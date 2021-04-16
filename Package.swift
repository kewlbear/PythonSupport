// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PythonSupport",
    products: [
        .library(
            name: "PythonSupport",
            targets: [
                "PythonSupport",
                "Resources",
                "Symbols",
                "Clibz",
            ]),
    ],
    dependencies: [
        .package(url: "https://github.com/kewlbear/Python-iOS.git", .branch("main")),
        .package(url: "https://github.com/alloyapple/CSqlite3.git", .branch("master")),
    ],
    targets: [
        .target(
            name: "PythonSupport",
            dependencies: []),
        .target(name: "Resources", dependencies: ["Symbols"], resources: [.copy("lib")]),
        .target(name: "Symbols",
                dependencies: [
                    "Python-iOS",
                    "CSqlite3",
                ]),
        .target(name: "Clibz", linkerSettings: [LinkerSetting.linkedLibrary("z")]),
        .testTarget(
            name: "PythonSupportTests",
            dependencies: ["PythonSupport"]),
    ]
)
