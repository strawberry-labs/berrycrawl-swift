import Foundation

public struct BrandDesignSystemTypographyFontFamilies: Codable, Hashable, Sendable {
    public let heading: String?
    public let primary: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        heading: String? = nil,
        primary: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.heading = heading
        self.primary = primary
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.heading = try container.decodeIfPresent(String.self, forKey: .heading)
        self.primary = try container.decodeIfPresent(String.self, forKey: .primary)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.heading, forKey: .heading)
        try container.encodeIfPresent(self.primary, forKey: .primary)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case heading
        case primary
    }
}