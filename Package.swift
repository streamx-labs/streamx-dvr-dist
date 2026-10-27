// swift-tools-version:5.9
// Generated for StreamX DVR 0.1.9; binary and bindings are released together.
import PackageDescription

let package = Package(
    name: "StreamXPairing",
    platforms: [.iOS(.v15), .tvOS(.v15)],
    products: [.library(name: "StreamXPairing", targets: ["StreamXPairing"])],
    targets: [
        .binaryTarget(
            name: "StreamXPairingFFI",
            url: "https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.9/StreamXPairing.xcframework.zip",
            checksum: "3eeb705f93a47e6665dc55d9ce0e303cdd524097348f7d4ecede7be0cc0748a5"
        ),
        .target(name: "StreamXPairing", dependencies: ["StreamXPairingFFI"], sources: ["StreamXPairing.swift"]),
    ]
)
