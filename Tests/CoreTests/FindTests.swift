import XCTest
@testable import findora

final class FindTests: XCTestCase {

  // MARK: - Setup
  var find: Find!

  override func setUp() {
      super.setUp()
      find = Find()
  }

  override func tearDown() {
      find = nil
      super.tearDown()
  }

  // MARK: - validateSearchInput() Tests
  func testEmptySearchInputThrowsError() {
    // Given
    find.searchInput = ""

    // When & Then
    XCTAssertThrowsError(try find.validateSearchInput(for: find.searchInput)) { error in
      XCTAssertEqual(error as? ExecutionError, ExecutionError.emptyInput)
    }
  }
  func testAvailableSearchInput() {
    // Given
    find.searchInput = "search"

    // When & Then
    XCTAssertNoThrow(try find.validateSearchInput(for: find.searchInput))
  }

  // MARK: - search() Tests
}
