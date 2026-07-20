import Foundation

public struct BrandDesignSystemImages: Codable, Hashable, Sendable {
    public let favicon: String?
    public let logo: String?
    public let ogImage: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        favicon: String? = nil,
        logo: String? = nil,
        ogImage: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.favicon = favicon
        self.logo = logo
        self.ogImage = ogImage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.favicon = try container.decodeIfPresent(String.self, forKey: .favicon)
        self.logo = try container.decodeIfPresent(String.self, forKey: .logo)
        self.ogImage = try container.decodeIfPresent(String.self, forKey: .ogImage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.favicon, forKey: .favicon)
        try container.encodeIfPresent(self.logo, forKey: .logo)
        try container.encodeIfPresent(self.ogImage, forKey: .ogImage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case favicon
        case logo
        case ogImage
    }
}