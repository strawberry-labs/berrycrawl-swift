import Foundation

public struct SummaryFormatDto: Codable, Hashable, Sendable {
    /// Specific query for focused summarization
    public let query: String?
    /// Format type
    public let type: SummaryFormatDtoType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        query: String? = nil,
        type: SummaryFormatDtoType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.query = query
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.query = try container.decodeIfPresent(String.self, forKey: .query)
        self.type = try container.decode(SummaryFormatDtoType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.query, forKey: .query)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case query
        case type
    }
}