# swift-libdeflate: agent guidance

This repository packages upstream libdeflate for SwiftPM. `README.md` describes the layout and the version table.

## Rules

- Never copy libdeflate source into this repository. `libdeflate/` is a submodule pinned to an upstream release tag, and `Package.swift` compiles its `lib/` sources.
- Move the submodule only to an upstream release tag, never to a branch head.
- Each release pins one libdeflate release: move the submodule, add a row to the README version table, and tag the merged commit. The first release was `0.0.1`; bump the patch for a new libdeflate release, and the minor when the package's own interface breaks.
- Keep the package free of wrapper code. The one test only proves the package links and round-trips.
- CI builds and tests the package on Linux and macOS on GitHub-hosted runners; the repository is public, so they cost nothing.
