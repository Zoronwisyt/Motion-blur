// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ZoronMotionBlur",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ZoronMotionBlur",
            type: .dynamic,
            targets: ["ZoronMotionBlur"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ZoronMotionBlur",
            dependencies: [],
            cSettings: [
                .unsafeFlags(["-fobjc-arc"])
            ],
            linkerSettings: [
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
                .linkedFramework("Metal"),
                .linkedFramework("QuartzCore")
            ]
        )
    ]
)
