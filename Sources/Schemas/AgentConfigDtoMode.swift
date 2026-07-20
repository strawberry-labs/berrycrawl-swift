import Foundation

/// Model routing mode. "default" uses the fast default model; "smart" uses the higher-latency reasoning model.
public enum AgentConfigDtoMode: String, Codable, Hashable, CaseIterable, Sendable {
    case `default`
    case smart
}