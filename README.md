# swift-libdeflate

[libdeflate](https://github.com/ebiggers/libdeflate) as a Swift package.

The repository holds no libdeflate source.
`libdeflate/` is a git submodule pinned to an upstream release tag,
and the `libdeflate` library target compiles that release's `lib/` sources.
`include/module.modulemap` exposes the library's one public header, `libdeflate.h`.
SwiftPM checks the submodule out with the package.

## Use

```swift
dependencies: [
    .package(url: "https://github.com/victor-software-house/swift-libdeflate.git", exact: "0.0.1"),
],
targets: [
    .target(name: "MyTarget", dependencies: [.product(name: "libdeflate", package: "swift-libdeflate")]),
]
```

Swift imports the C interface as `import libdeflate`: whole-buffer DEFLATE, zlib and gzip compression and decompression, with CRC-32 and Adler-32.
libdeflate does not stream; use zlib for data that arrives in pieces.

## Versions

Each release of this package pins one libdeflate release:

| Package | libdeflate |
|:--|:--|
| 0.0.1 | v1.26 |

## Licence

libdeflate is MIT; its licence is in the submodule, at `libdeflate/COPYING`.
The packaging in this repository is MIT as well; see `LICENSE`.
