@_spi(Experimental) import Testing

// To access colors check .swift-testing/tag-colors.json at Home directory
// Don't forget to specify whole tag name (if embedded in enum)
extension Tag {
    enum colored {
        @Tag static var blumine: Tag
        @Tag static var menthol: Tag
        @Tag static var myOrange: Tag
    }
}

// tag-colors.json
/*
 {
    ".colored.menthol": "#C9F29B",
    ".colored.blumine": "#1E517B",
    ".colored.myOrange": "orange"
 }
 */

@Suite
struct ColoredTests {

    @Test(.tags(.yellow))
    func yellowTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test(.tags(.orange))
    func orangeTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test(.tags(.green))
    func greenwTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test(.tags(.blue))
    func blueTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test(.tags(.purple))
    func purpleTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test(.tags(.colored.blumine))
    func blumineTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test(.tags(.colored.menthol))
    func mentholTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
    
    @Test(.tags(.colored.myOrange))
    func myOrangeTest() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
}
