import Foundation

/// How to handle sitemaps
public enum MapDtoSitemap: String, Codable, Hashable, CaseIterable, Sendable {
    case include
    case skip
    case only
}