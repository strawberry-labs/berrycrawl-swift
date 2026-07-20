import Foundation

public struct BrandResponseDataMeta: Codable, Hashable, Sendable {
    public let cached: Bool
    public let creditsUsed: Int
    public let fetchedAt: Date
    public let sourceUrl: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cached: Bool,
        creditsUsed: Int,
        fetchedAt: Date,
        sourceUrl: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cached = cached
        self.creditsUsed = creditsUsed
        self.fetchedAt = fetchedAt
        self.sourceUrl = sourceUrl
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cached = try container.decode(Bool.self, forKey: .cached)
        self.creditsUsed = try container.decode(Int.self, forKey: .creditsUsed)
        self.fetchedAt = try container.decode(Date.self, forKey: .fetchedAt)
        self.sourceUrl = try container.decode(String.self, forKey: .sourceUrl)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cached, forKey: .cached)
        try container.encode(self.creditsUsed, forKey: .creditsUsed)
        try container.encode(self.fetchedAt, forKey: .fetchedAt)
        try container.encode(self.sourceUrl, forKey: .sourceUrl)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cached
        case creditsUsed
        case fetchedAt
        case sourceUrl
    }
}