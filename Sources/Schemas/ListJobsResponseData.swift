import Foundation

public struct ListJobsResponseData: Codable, Hashable, Sendable {
    public let jobs: [JobSummary]
    public let pagination: Pagination
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        jobs: [JobSummary],
        pagination: Pagination,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.jobs = jobs
        self.pagination = pagination
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.jobs = try container.decode([JobSummary].self, forKey: .jobs)
        self.pagination = try container.decode(Pagination.self, forKey: .pagination)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.jobs, forKey: .jobs)
        try container.encode(self.pagination, forKey: .pagination)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case jobs
        case pagination
    }
}