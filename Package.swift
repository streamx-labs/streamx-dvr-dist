// swift-tools-version:5.9
// Generated for StreamX DVR 0.1.8; binary and bindings are released together.
import PackageDescription

let package = Package(
    name: "StreamXPairing",
    platforms: [.iOS(.v15), .tvOS(.v15)],
    products: [.library(name: "StreamXPairing", targets: ["StreamXPairing"])],
    targets: [
        .binaryTarget(
            name: "StreamXPairingFFI",
            url: "https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.8/StreamXPairing.xcframework.zip",
            checksum: "3801e3581b88e9a713af8f48729a90fae12a39b943943c189f4831e5ee0dca4c"
        ),
        .target(name: "StreamXPairing", dependencies: ["StreamXPairingFFI"], sources: ["StreamXPairing.swift"]),
    ]
)
