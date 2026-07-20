import Foundation

/// Proxy mode. auto starts direct and escalates only when blocked. basic is an alias for none.
public enum ScrapeDtoProxy: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case basic
    case datacenter
    case residential
    case stealth
    case auto
}