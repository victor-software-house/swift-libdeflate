import libdeflate
import Testing

/// The package links and works: a gzip round trip through the upstream library.
@Test func aGzipRoundTripReturnsTheInput() throws {
    let input = Array(String(repeating: "flowgate gzips request bodies with libdeflate. ", count: 2000).utf8)
    let compressor = try #require(libdeflate_alloc_compressor(6))
    defer { libdeflate_free_compressor(compressor) }
    var compressed = [UInt8](repeating: 0, count: libdeflate_gzip_compress_bound(compressor, input.count))
    let size = libdeflate_gzip_compress(compressor, input, input.count, &compressed, compressed.count)
    #expect(size > 0 && size < input.count / 10)
    let decompressor = try #require(libdeflate_alloc_decompressor())
    defer { libdeflate_free_decompressor(decompressor) }
    var output = [UInt8](repeating: 0, count: input.count)
    var produced = 0
    let result = libdeflate_gzip_decompress(decompressor, compressed, size, &output, output.count, &produced)
    #expect(result == LIBDEFLATE_SUCCESS)
    #expect(Array(output.prefix(produced)) == input)
}
