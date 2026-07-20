import Foundation

public struct BrandDesignSystemTypographyFontSizes: Codable, Hashable, Sendable {
    public let body: String?
    public let h1: String?
    public let h2: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        body: String? = nil,
        h1: String? = nil,
        h2: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.body = body
        self.h1 = h1
        self.h2 = h2
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.body = try container.decodeIfPresent(String.self, forKey: .body)
        self.h1 = try container.decodeIfPresent(String.self, forKey: .h1)
        self.h2 = try container.decodeIfPresent(String.self, forKey: .h2)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.body, forKey: .body)
        try container.encodeIfPresent(self.h1, forKey: .h1)
        try container.encodeIfPresent(self.h2, forKey: .h2)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case body
        case h1
        case h2
    }
}