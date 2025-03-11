import XCTest
import ArgumentParser
@testable import findora

final class SearchOptionsTests: XCTestCase {

    func testParsingValidArguments() throws {
        let arguments = ["--index", "my_index", "--config", "release", "--verbose"]
        let options = try SearchOptions.parse(arguments)

        XCTAssertEqual(options.index, "my_index")
        XCTAssertEqual(options.config, .release)
        XCTAssertTrue(options.verbose)
    }

    func testParsingWithDefaultValues() throws {
        let options = try SearchOptions.parse([])

        XCTAssertNil(options.index)
        XCTAssertEqual(options.config, .debug)
        XCTAssertFalse(options.verbose)
    }
}
