import Foundation

public enum ListJobsRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case crawl
    case extract
}