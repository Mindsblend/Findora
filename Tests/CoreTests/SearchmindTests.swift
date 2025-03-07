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
    
  }
  func testNilIndexDoesNotThrowError() { /* Test Implementation */ }
  func testInvalidConfigThrowsError() {
      // Given
      searchmind.options.index = ""
      searchmind.options.config = .invalid
      searchmind.options.verbose = false

      // When & Then
      XCTAssertThrowsError(try searchmind.validateSearchOptions()) { error in
          XCTAssertEqual(error as? ExecutionError, ExecutionError.invalidConfig(searchmind.options.config.rawValue))
      }
  }
  
  func testEmptyIndexThrowsError() {
    // Given
    searchmind.options.index = ""
    searchmind.options.config = .debug
    searchmind.options.verbose = false

    // When & Then
    XCTAssertThrowsError(try searchmind.validateSearchOptions()) { error in
      XCTAssertEqual(error as? ExecutionError, ExecutionError.emptyInput)
    }
  }


  // MARK: - processSearchOptions() Tests
}
