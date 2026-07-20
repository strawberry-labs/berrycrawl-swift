import Foundation

public enum ScreenshotDtoFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case png
    case jpeg
    case webp
}