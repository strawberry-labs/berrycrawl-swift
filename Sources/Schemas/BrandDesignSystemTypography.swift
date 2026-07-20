import Foundation

public struct BrandDesignSystemTypography: Codable, Hashable, Sendable {
    public let fontFamilies: BrandDesignSystemTypographyFontFamilies
    public let fontSizes: BrandDesignSystemTypographyFontSizes
    public let fontStacks: BrandDesignSystemTypographyFontStacks
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fontFamilies: BrandDesignSystemTypographyFontFamilies,
        fontSizes: BrandDesignSystemTypographyFontSizes,
        fontStacks: BrandDesignSystemTypographyFontStacks,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fontFamilies = fontFamilies
        self.fontSizes = fontSizes
        self.fontStacks = fontStacks
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fontFamilies = try container.decode(BrandDesignSystemTypographyFontFamilies.self, forKey: .fontFamilies)
        self.fontSizes = try container.decode(BrandDesignSystemTypographyFontSizes.self, forKey: .fontSizes)
        self.fontStacks = try container.decode(BrandDesignSystemTypographyFontStacks.self, forKey: .fontStacks)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fontFamilies, forKey: .fontFamilies)
        try container.encode(self.fontSizes, forKey: .fontSizes)
        try container.encode(self.fontStacks, forKey: .fontStacks)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fontFamilies
        case fontSizes
        case fontStacks
    }
}