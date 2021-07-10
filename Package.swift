// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "gpuimageDemo",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "GPUImage", url: "https://github.com/BradLarson/GPUImage2.git", from: "0.0.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "gpuimageDemo",
            dependencies: [
            "GPUImage"
            ],
            resources: [
            .copy("Resources/Images/WID-small.jpg"),
            .copy("README.md")
            ]),
        .testTarget(
            name: "gpuimageTests",
            dependencies: ["gpuimageDemo"]),
    ]
)
