import Foundation

public struct AccountResponseDataPlan: Codable, Hashable, Sendable {
    public let concurrency: Int
    public let id: String
    public let name: String
    public let queueLimit: Int
    public let rateLimitPerMinute: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        concurrency: Int,
        id: String,
        name: String,
        queueLimit: Int,
        rateLimitPerMinute: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.concurrency = concurrency
        self.id = id
        self.name = name
        self.queueLimit = queueLimit
        self.rateLimitPerMinute = rateLimitPerMinute
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.concurrency = try container.decode(Int.self, forKey: .concurrency)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.queueLimit = try container.decode(Int.self, forKey: .queueLimit)
        self.rateLimitPerMinute = try container.decode(Int.self, forKey: .rateLimitPerMinute)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.concurrency, forKey: .concurrency)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.queueLimit, forKey: .queueLimit)
        try container.encode(self.rateLimitPerMinute, forKey: .rateLimitPerMinute)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case concurrency
        case id
        case name
        case queueLimit
        case rateLimitPerMinute
    }
}