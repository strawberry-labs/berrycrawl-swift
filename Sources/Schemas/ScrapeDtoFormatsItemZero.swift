import Foundation

public enum ScrapeDtoFormatsItemZero: String, Codable, Hashable, CaseIterable, Sendable {
    case markdown
    case html
    case rawhtml
    case links
    case images
    case summary
    case json
    case changeTracking
}