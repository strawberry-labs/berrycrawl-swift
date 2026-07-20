import Foundation

public struct BrandProfile: Codable, Hashable, Sendable {
    public let branding: BrandDesignSystem?
    public let colors: [BrandProfileColorsItem]
    public let description: String?
    public let domain: String
    public let fonts: [BrandProfileFontsItem]
    public let images: [BrandAsset]
    public let language: Nullable<String>?
    public let logos: [BrandAsset]
    public let name: String
    public let socials: [BrandProfileSocialsItem]
    public let tagline: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        branding: BrandDesignSystem? = nil,
        colors: [BrandProfileColorsItem],
        description: String? = nil,
        domain: String,
        fonts: [BrandProfileFontsItem],
        images: [BrandAsset],
        language: Nullable<String>? = nil,
        logos: [BrandAsset],
        name: String,
        socials: [BrandProfileSocialsItem],
        tagline: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.branding = branding
        self.colors = colors
        self.description = description
        self.domain = domain
        self.fonts = fonts
        self.images = images
        self.language = language
        self.logos = logos
        self.name = name
        self.socials = socials
        self.tagline = tagline
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.branding = try container.decodeIfPresent(BrandDesignSystem.self, forKey: .branding)
        self.colors = try container.decode([BrandProfileColorsItem].self, forKey: .colors)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.domain = try container.decode(String.self, forKey: .domain)
        self.fonts = try container.decode([BrandProfileFontsItem].self, forKey: .fonts)
        self.images = try container.decode([BrandAsset].self, forKey: .images)
        self.language = try container.decodeNullableIfPresent(String.self, forKey: .language)
        self.logos = try container.decode([BrandAsset].self, forKey: .logos)
        self.name = try container.decode(String.self, forKey: .name)
        self.socials = try container.decode([BrandProfileSocialsItem].self, forKey: .socials)
        self.tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.branding, forKey: .branding)
        try container.encode(self.colors, forKey: .colors)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.domain, forKey: .domain)
        try container.encode(self.fonts, forKey: .fonts)
        try container.encode(self.images, forKey: .images)
        try container.encodeNullableIfPresent(self.language, forKey: .language)
        try container.encode(self.logos, forKey: .logos)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.socials, forKey: .socials)
        try container.encodeIfPresent(self.tagline, forKey: .tagline)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case branding
        case colors
        case description
        case domain
        case fonts
        case images
        case language
        case logos
        case name
        case socials
        case tagline
    }
}