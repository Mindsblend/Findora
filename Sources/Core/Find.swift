import ArgumentParser

struct Find: ParsableCommand {

  static let configuration = CommandConfiguration(commandName: "find",
                                                  abstract: "Use the find subcommand in order to find relevant files with the aid of AI",
                                                  usage: """
                                                  findora find <text> [OPTIONS]

                                                  Example:
                                                  findora find "latest AI research"
                                                  findora find "Swift design patterns"
                                                  """,
                                                  discussion: """
                                                  The 'find' command allows you to search for relevant information using AI-powered recommendations.

                                                  Features:
                                                  - Supports keyword-based search with intelligent filtering.

                                                  Options:

                                                  Example Usage:
                                                  - Find AI-related articles:
                                                  findora find "AI ethics"
                                                  """,
                                                  subcommands: [])

  @Argument(help: "Search input from the user")
  public var searchInput: String = ""

  mutating func validate() throws {
    do {
      try validateSearchInput(for: searchInput)
    } catch let error as ExecutionError {
        print(error.description)
    } catch {
        print("An unexpected error occurred: \(error.localizedDescription)")
    }
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
