import Foundation

public struct BrandProfileFontsItem: Codable, Hashable, Sendable {
    public let family: String
    public let weights: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        family: String,
        weights: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.family = family
        self.weights = weights
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.family = try container.decode(String.self, forKey: .family)
        self.weights = try container.decodeIfPresent([String].self, forKey: .weights)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.family, forKey: .family)
        try container.encodeIfPresent(self.weights, forKey: .weights)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case family
        case weights
    }
}