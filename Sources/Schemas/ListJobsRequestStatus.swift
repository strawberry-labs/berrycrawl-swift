import Foundation

public enum ListJobsRequestStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case pending = "PENDING"
    case running = "RUNNING"
    case completed = "COMPLETED"
    case failed = "FAILED"
    case cancelled = "CANCELLED"
}