// swift-tools-version:6.1
import PackageDescription

let package = Package(
    name: "CapitalOSKit",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "CapitalOSKit",
            targets: ["CapitalOSKitWrapper"]
        ),
    ],
    dependencies: [
        // Using the plaid-link-ios-spm repository, which provides the LinkKit product.
        .package(url: "https://github.com/plaid/plaid-link-ios-spm.git", from: "5.6.0")
    ],
    targets: [
        .binaryTarget(
            name: "CapitalOSKitBinary",
            path: "CapitalOSKit.xcframework"
        ),
        .target(
            name: "CapitalOSKitWrapper",
            dependencies: [
                "CapitalOSKitBinary",
                .product(name: "LinkKit", package: "plaid-link-ios-spm")
            ],
            path: "Sources"
        )
    ]
)