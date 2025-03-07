import Foundation

enum ExecutionError: Error, CustomStringConvertible, Equatable {
    case invalidConfig(String)
    case emptyInput
    case unknown

    var description: String {
        switch self {
        case .invalidConfig(let config):
            return "Error: Invalid configuration: \(config). Allowed values: debug, release, custom."
        case .emptyInput:
            return "Error: Input cannot be empty. Please provide a value."
        case .unknown:
            return "Error: An unknown error occurred."
        }
    }
}
