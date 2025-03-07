import XCTest
@testable import searchmind

final class ExecutionErrorTests: XCTestCase {

    func testInvalidConfigErrorDescription() {
        let error: ExecutionError = .invalidConfig("testing")
        XCTAssertEqual(error.description, "Error: Invalid configuration: testing. Allowed values: debug, release, custom.")
    }

    func testEmptyInputErrorDescription() {
        let error: ExecutionError = .emptyInput
        XCTAssertEqual(error.description, "Error: Input cannot be empty. Please provide a value.")
    }

    func testUnknownErrorDescription() {
        let error: ExecutionError = .unknown
        XCTAssertEqual(error.description, "Error: An unknown error occurred.")
    }
}

