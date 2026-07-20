import Foundation

public struct JobSummary: Codable, Hashable, Sendable {
    public let completed: Nullable<Int>?
    public let completedAt: Nullable<Date>?
    public let createdAt: Date
    public let creditsUsed: Int
    public let error: Nullable<String>?
    public let failed: Nullable<Int>?
    public let id: String
    public let startedAt: Nullable<Date>?
    public let status: String
    public let total: Int
    public let type: JobSummaryType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        completed: Nullable<Int>? = nil,
        completedAt: Nullable<Date>? = nil,
        createdAt: Date,
        creditsUsed: Int,
        error: Nullable<String>? = nil,
        failed: Nullable<Int>? = nil,
        id: String,
        startedAt: Nullable<Date>? = nil,
        status: String,
        total: Int,
        type: JobSummaryType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.completed = completed
        self.completedAt = completedAt
        self.createdAt = createdAt
        self.creditsUsed = creditsUsed
        self.error = error
        self.failed = failed
        self.id = id
        self.startedAt = startedAt
        self.status = status
        self.total = total
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.completed = try container.decodeNullableIfPresent(Int.self, forKey: .completed)
        self.completedAt = try container.decodeNullableIfPresent(Date.self, forKey: .completedAt)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.creditsUsed = try container.decode(Int.self, forKey: .creditsUsed)
        self.error = try container.decodeNullableIfPresent(String.self, forKey: .error)
        self.failed = try container.decodeNullableIfPresent(Int.self, forKey: .failed)
        self.id = try container.decode(String.self, forKey: .id)
        self.startedAt = try container.decodeNullableIfPresent(Date.self, forKey: .startedAt)
        self.status = try container.decode(String.self, forKey: .status)
        self.total = try container.decode(Int.self, forKey: .total)
        self.type = try container.decode(JobSummaryType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeNullableIfPresent(self.completed, forKey: .completed)
        try container.encodeNullableIfPresent(self.completedAt, forKey: .completedAt)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.creditsUsed, forKey: .creditsUsed)
        try container.encodeNullableIfPresent(self.error, forKey: .error)
        try container.encodeNullableIfPresent(self.failed, forKey: .failed)
        try container.encode(self.id, forKey: .id)
        try container.encodeNullableIfPresent(self.startedAt, forKey: .startedAt)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.total, forKey: .total)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case completed
        case completedAt
        case createdAt
        case creditsUsed
        case error
        case failed
        case id
        case startedAt
        case status
        case total
        case type
    }
}