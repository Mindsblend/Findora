import XCTest
@testable import searchmind

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
  func testEmptyIndexThrowsError() { }
  func testAvailableIndex() { }

  // MARK: - search() Tests
}
