// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "PrimerIPay88MYSDK",
    platforms: [.iOS(.v13)],
    products: [.library(name: "PrimerIPay88MYSDK", targets: ["PrimerIPay88MYSDK"])],
    targets: [
        .binaryTarget(name: "libipay88sdk", path: "PrimerIPay88SDK/Frameworks/libipay88sdk.xcframework"),
        // SPM cannot mix Swift and Objective-C in one target, so the iPay88 headers get their own.
        .target(
            name: "IPay88ObjC",
            dependencies: ["libipay88sdk"],
            path: "PrimerIPay88SDK/IPay88ObjC",
            linkerSettings: [.linkedFramework("WebKit")]
        ),
        .target(name: "PrimerIPay88MYSDK", dependencies: ["IPay88ObjC"], path: "PrimerIPay88SDK/Classes")
    ]
)
