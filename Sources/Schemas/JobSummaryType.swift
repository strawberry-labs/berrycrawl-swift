import Foundation

public enum JobSummaryType: String, Codable, Hashable, CaseIterable, Sendable {
    case crawl
    case extract
}