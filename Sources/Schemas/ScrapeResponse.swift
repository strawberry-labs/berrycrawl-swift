import Foundation

public struct ScrapeResponse: Codable, Hashable, Sendable {
    public let credits: ScrapeResponseCredits
    public let data: [String: JSONValue]?
    public let error: String?
    public let metadata: ScrapeMetadata
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        credits: ScrapeResponseCredits,
        data: [String: JSONValue]? = nil,
        error: String? = nil,
        metadata: ScrapeMetadata,
        success: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.credits = credits
        self.data = data
        self.error = error
        self.metadata = metadata
        self.success = success
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.credits = try container.decode(ScrapeResponseCredits.self, forKey: .credits)
        self.data = try container.decodeIfPresent([String: JSONValue].self, forKey: .data)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.metadata = try container.decode(ScrapeMetadata.self, forKey: .metadata)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.credits, forKey: .credits)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encode(self.metadata, forKey: .metadata)
        try container.encode(self.success, forKey: .success)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case credits
        case data
        case error
        case metadata
        case success
    }
}