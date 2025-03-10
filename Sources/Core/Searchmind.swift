import ArgumentParser

@main
struct Searchmind: ParsableCommand {

  static let configuration = CommandConfiguration(commandName: "searchmind",
                                                  abstract: """
                                                  Use Searchmind to find relevant search results based on your query. Searchmind uses AI to provide you with the most relevant information.
                                                  """,
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
    do {
        try validateSearchOptions()
    } catch let error as ExecutionError {
        print(error.description)
    } catch {
        print("An unexpected error occurred: \(error.localizedDescription)")
    }
  }

  mutating func run() throws {
    processSearchOptions()
  }

  // MARK: - Helper Funtions
  func validateSearchOptions() throws {
    guard options.config == .debug || options.config == .release || options.config == .custom else {
        throw ExecutionError.invalidConfig(options.config.rawValue)
    }

    if options.index.isEmpty {
        throw ExecutionError.emptyInput
    }
    print("DEBUG: The index value is \(String(describing: options.index))")
  }

  func processSearchOptions() {
    print("🔍 Running SearchMind with:")
    print("  - Index: \(options.index)")
    print("  - Config mode: \(options.config.rawValue)")
    print("  - Verbose mode: \(options.verbose ? "ON" : "OFF")")
  }
}
