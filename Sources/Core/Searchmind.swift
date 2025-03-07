import ArgumentParser

@main
struct Searchmind: ParsableCommand {

  static let configuration = CommandConfiguration(commandName: "searchmind",
                                                  abstract: "An AI-powered search engine for intelligent recommendations.",
                                                  usage: """
                                                  searchmind [OPTIONS] [SUBCOMMAND]

                                                  Example:
                                                    searchmind --index "my_index" --config debug
                                                    searchmind find "AI trends"
                                                  """,
                                                  discussion: """
                                                  SearchMind is an intelligent search tool designed to help users find relevant 
                                                  information quickly using AI-powered recommendations.

                                                  Features:
                                                  - Supports multiple configurations (debug, release, custom).
                                                  - Provides intelligent search indexing.
                                                  - Allows verbose mode for debugging.

                                                  Available Subcommands:
                                                  - find: Finds relevant search results based on the query.

                                                  Run `searchmind [SUBCOMMAND] --help` for details on each command.
                                                  """,
                                                  version: "1.0.0",
                                                  subcommands: [Find.self])

  @OptionGroup var options: SearchOptions

  mutating func validate() throws {
    try validateSearchOptions()
  }

  mutating func run() throws {
    processSearchOptions()
  }

  // MARK: - Helper Funtions
  func validateSearchOptions() throws {
    guard options.config == .debug || options.config == .release || options.config == .custom else {
        throw ExecutionError.invalidConfig(options.config.rawValue)
    }

    if let index = options.index, index.isEmpty {
      throw ExecutionError.emptyInput
    }
  }

  func processSearchOptions() {
    print("🔍 Running SearchMind with:")
    print("  - Index: \(options.index ?? "default")")
    print("  - Config mode: \(options.config.rawValue)")
    print("  - Verbose mode: \(options.verbose ? "ON" : "OFF")")
  }
}
