import Foundation

/// Capture at CSS pixel size or the emulated device pixel ratio
public enum ScreenshotDtoScale: String, Codable, Hashable, CaseIterable, Sendable {
    case css
    case device
}