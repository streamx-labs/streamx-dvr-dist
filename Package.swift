// swift-tools-version:5.9
// Generated for StreamX DVR 0.1.12; binary and bindings are released together.
import PackageDescription

let package = Package(
    name: "StreamXPairing",
    platforms: [.iOS(.v15), .tvOS(.v15)],
    products: [.library(name: "StreamXPairing", targets: ["StreamXPairing"])],
    targets: [
        .binaryTarget(
            name: "StreamXPairingFFI",
            url: "https://github.com/streamx-labs/streamx-dvr-dist/releases/download/v0.1.12/StreamXPairing.xcframework.zip",
            checksum: "661f841de14192475c092fa554084dec114f741e8e452019aaaf66e05d965929"
        ),
        .target(name: "StreamXPairing", dependencies: ["StreamXPairingFFI"], sources: ["StreamXPairing.swift"]),
    ]
)
