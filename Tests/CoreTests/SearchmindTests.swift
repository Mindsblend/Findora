import XCTest
@testable import searchmind

final class SearchmindTests: XCTestCase {

  // MARK: - Setup
  var searchmind: Searchmind!

  override func setUp() {
      super.setUp()
      searchmind = Searchmind()
  }

  override func tearDown() {
      searchmind = nil
      super.tearDown()
  }

  // MARK: - validateSearchOptions() Tests
  func testValidConfigAndIndex() {
    // Given
    let options = SearchOptions(index: "default", config: .debug, verbose: false)
    searchmind.options = options

    // When & Then
    XCTAssertNoThrow(try searchmind.validateSearchOptions())
  }
  func testNilIndexDoesNotThrowError() {
    // Given
    let options = SearchOptions(config: .debug, verbose: false) // Index sets to 'default' when it's not provided by the user
    searchmind.options = options

    // When & Then
    XCTAssertNoThrow(try searchmind.validateSearchOptions())
  }
  func testInvalidConfigThrowsError() {
    // Given
    let options = SearchOptions(index: "default", config: .invalid, verbose: false)
    searchmind.options = options


    // When & Then
    XCTAssertThrowsError(try searchmind.validateSearchOptions()) { error in
        XCTAssertEqual(error as? ExecutionError, ExecutionError.invalidConfig(searchmind.options.config.rawValue))
    }
  }
  
  func testEmptyIndexThrowsError() {
    // Given
    let options = SearchOptions(index: "", config: .debug, verbose: false)
    searchmind.options = options

    // When & Then
    XCTAssertThrowsError(try searchmind.validateSearchOptions()) { error in
      XCTAssertEqual(error as? ExecutionError, ExecutionError.emptyInput)
    }
  }


  // MARK: - processSearchOptions() Tests
}
