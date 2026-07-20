import Foundation

/// Sitemap handling strategy
public enum CrawlDtoSitemap: String, Codable, Hashable, CaseIterable, Sendable {
    case include
    case skip
    case only
}