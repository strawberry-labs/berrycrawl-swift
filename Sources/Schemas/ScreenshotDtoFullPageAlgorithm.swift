import Foundation

/// auto uses native capture for normal pages and stitched slices for very tall pages
public enum ScreenshotDtoFullPageAlgorithm: String, Codable, Hashable, CaseIterable, Sendable {
    case auto
    case native
    case stitch
}