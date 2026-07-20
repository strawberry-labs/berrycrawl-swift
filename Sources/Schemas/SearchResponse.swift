import Foundation

public struct SearchResponse: Codable, Hashable, Sendable {
    public let creditsUsed: Int
    public let data: [SearchResult]
    public let provider: SearchResponseProvider
    public let query: String
    public let success: Bool
    public let total: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        creditsUsed: Int,
        data: [SearchResult],
        provider: SearchResponseProvider,
        query: String,
        success: Bool,
        total: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.creditsUsed = creditsUsed
        self.data = data
        self.provider = provider
        self.query = query
        self.success = success
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.creditsUsed = try container.decode(Int.self, forKey: .creditsUsed)
        self.data = try container.decode([SearchResult].self, forKey: .data)
        self.provider = try container.decode(SearchResponseProvider.self, forKey: .provider)
        self.query = try container.decode(String.self, forKey: .query)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.total = try container.decode(Int.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.creditsUsed, forKey: .creditsUsed)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.provider, forKey: .provider)
        try container.encode(self.query, forKey: .query)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case creditsUsed
        case data
        case provider
        case query
        case success
        case total
    }
}