// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-libdeflate",
    products: [
        .library(name: "libdeflate", targets: ["libdeflate"]),
    ],
    targets: [
        // The upstream library sources, from the release the submodule pins. The module map in
        // include/ exposes only libdeflate.h, the library's one public header.
        .target(
            name: "libdeflate",
            path: ".",
            sources: ["libdeflate/lib"],
            publicHeadersPath: "include"
        ),
        .testTarget(name: "libdeflateTests", dependencies: ["libdeflate"]),
    ]
)
