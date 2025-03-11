import XCTest
@testable import findora

final class FindoraTests: XCTestCase {

  // MARK: - Setup
  var findora: Findora!

  override func setUp() {
      super.setUp()
      findora = Findora()
  }

  override func tearDown() {
      findora = nil
      super.tearDown()
  }

  // MARK: - validateSearchOptions() Tests
  func testValidConfigAndIndex() {
    // Given
    let options = SearchOptions(index: "default", config: .debug, verbose: false)
    findora.options = options

    // When & Then
    XCTAssertNoThrow(try findora.validateSearchOptions())
  }
  func testNilIndexDoesNotThrowError() {
    // Given
    let options = SearchOptions(config: .debug, verbose: false) // Index sets to 'default' when it's not provided by the user
    findora.options = options

    // When & Then
    XCTAssertNoThrow(try findora.validateSearchOptions())
  }
  func testInvalidConfigThrowsError() {
    // Given
    let options = SearchOptions(index: "default", config: .invalid, verbose: false)
    findora.options = options


    // When & Then
    XCTAssertThrowsError(try findora.validateSearchOptions()) { error in
        XCTAssertEqual(error as? ExecutionError, ExecutionError.invalidConfig(findora.options.config.rawValue))
    }
  }
  
  func testEmptyIndexThrowsError() {
    // Given
    let options = SearchOptions(index: "", config: .debug, verbose: false)
    findora.options = options

    // When & Then
    XCTAssertThrowsError(try findora.validateSearchOptions()) { error in
      XCTAssertEqual(error as? ExecutionError, ExecutionError.emptyInput)
    }
  }


  // MARK: - processSearchOptions() Tests
}
