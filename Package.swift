// swift-tools-version:5.9
// Generated for StreamX DVR 0.1.16; binary and bindings are released together.
import PackageDescription

let package = Package(
    name: "StreamXPairing",
    platforms: [.iOS(.v15), .tvOS(.v15)],
    products: [.library(name: "StreamXPairing", targets: ["StreamXPairing"])],
    targets: [
        .binaryTarget(
            name: "StreamXPairingFFI",
            url: "https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.16/StreamXPairing.xcframework.zip",
            checksum: "f4e27fb0bad4139c037a89f0854491bb0542fd0d66e1d16dcde1d1d57a54d30f"
        ),
        .target(name: "StreamXPairing", dependencies: ["StreamXPairingFFI"], sources: ["StreamXPairing.swift"]),
    ]
)
