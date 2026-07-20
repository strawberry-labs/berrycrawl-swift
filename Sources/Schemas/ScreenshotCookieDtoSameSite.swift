import Foundation

public enum ScreenshotCookieDtoSameSite: String, Codable, Hashable, CaseIterable, Sendable {
    case strict = "Strict"
    case lax = "Lax"
    case none = "None"
}