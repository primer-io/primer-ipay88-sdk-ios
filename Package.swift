// swift-tools-version:5.8

import PackageDescription

let package = Package(
    name: "PrimerIPay88MYSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "PrimerIPay88MYSDK",
            targets: [
                "PrimerIPay88MYSDK",
                "libipay88sdk"
            ]
        )
    ],
    targets: [
        .target(
            name: "PrimerIPay88MYSDK",
            dependencies: [
                "libipay88sdk"
            ],
            path: "Sources/",
            sources: [
                "Classes/",
            ],
            cSettings: [
                .headerSearchPath("Headers/")
            ]
        ),
        .binaryTarget(
            name: "libipay88sdk",
            path: "Sources/Frameworks/libipay88sdk.xcframework"
        )
    ],
    swiftLanguageVersions: [.v5]
)
