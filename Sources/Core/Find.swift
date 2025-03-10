import ArgumentParser

struct Find: ParsableCommand {

  static let configuration = CommandConfiguration(commandName: "find",
                                                  abstract: "Use the find subcommand in order to find relevant files with the aid of AI",
                                                  usage: """
                                                  searchmind find <text> [OPTIONS]

                                                  Example:
                                                    searchmind find "latest AI research"
                                                    searchmind find "Swift design patterns"
                                                  """,
                                                  discussion: """
                                                  The 'find' command allows you to search for relevant information using AI-powered recommendations.

                                                  Features:
                                                  - Supports keyword-based search with intelligent filtering.

                                                  Options:

                                                  Example Usage:
                                                  - Find AI-related articles:
                                                    searchmind find "AI ethics"
                                                  """,
                                                  subcommands: [])

  @Argument(help: "Search input from the user")
  public var searchInput: String

  mutating func validate() throws {
    try validateSearchInput(for: searchInput)
  }

  mutating func run() throws {
    search(for: searchInput)
  }

  // MARK: - Helper Functions
  public func validateSearchInput(for searchInput: String) throws {
    if searchInput.isEmpty {
      throw ExecutionError.emptyInput
    }
  }

  func search(for searchInput: String) {
    print("🔎 Finding results for '\(searchInput)'")
  }
}
