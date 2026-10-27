// swift-tools-version:5.9
// Generated for StreamX DVR 0.1.13; binary and bindings are released together.
import PackageDescription

let package = Package(
    name: "StreamXPairing",
    platforms: [.iOS(.v15), .tvOS(.v15)],
    products: [.library(name: "StreamXPairing", targets: ["StreamXPairing"])],
    targets: [
        .binaryTarget(
            name: "StreamXPairingFFI",
            url: "https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.13/StreamXPairing.xcframework.zip",
            checksum: "b1701306c464d9c14724124a2a891de1de758a6a9395c38af5e3ce1787e13dbe"
        ),
        .target(name: "StreamXPairing", dependencies: ["StreamXPairingFFI"], sources: ["StreamXPairing.swift"]),
    ]
)
