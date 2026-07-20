import Foundation

/// Page readiness milestone used before capture
public enum ScreenshotDtoWaitUntil: String, Codable, Hashable, CaseIterable, Sendable {
    case domcontentloaded
    case load
    case networkidle
}