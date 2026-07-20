import Foundation

/// Return a CDN URL or an inline data URL
public enum ScreenshotDtoResponseFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case url
    case base64
}