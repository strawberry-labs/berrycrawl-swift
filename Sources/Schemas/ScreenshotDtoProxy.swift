import Foundation

/// Proxy mode
public enum ScreenshotDtoProxy: String, Codable, Hashable, CaseIterable, Sendable {
    case none
    case basic
    case datacenter
    case residential
    case stealth
    case auto
}