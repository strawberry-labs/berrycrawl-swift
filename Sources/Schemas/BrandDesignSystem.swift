import Foundation

public struct BrandDesignSystem: Codable, Hashable, Sendable {
    public let colors: BrandDesignSystemColors
    public let colorScheme: BrandDesignSystemColorScheme
    public let components: BrandDesignSystemComponents
    public let images: BrandDesignSystemImages
    public let spacing: BrandDesignSystemSpacing
    public let typography: BrandDesignSystemTypography
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        colors: BrandDesignSystemColors,
        colorScheme: BrandDesignSystemColorScheme,
        components: BrandDesignSystemComponents,
        images: BrandDesignSystemImages,
        spacing: BrandDesignSystemSpacing,
        typography: BrandDesignSystemTypography,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.colors = colors
        self.colorScheme = colorScheme
        self.components = components
        self.images = images
        self.spacing = spacing
        self.typography = typography
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.colors = try container.decode(BrandDesignSystemColors.self, forKey: .colors)
        self.colorScheme = try container.decode(BrandDesignSystemColorScheme.self, forKey: .colorScheme)
        self.components = try container.decode(BrandDesignSystemComponents.self, forKey: .components)
        self.images = try container.decode(BrandDesignSystemImages.self, forKey: .images)
        self.spacing = try container.decode(BrandDesignSystemSpacing.self, forKey: .spacing)
        self.typography = try container.decode(BrandDesignSystemTypography.self, forKey: .typography)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.colors, forKey: .colors)
        try container.encode(self.colorScheme, forKey: .colorScheme)
        try container.encode(self.components, forKey: .components)
        try container.encode(self.images, forKey: .images)
        try container.encode(self.spacing, forKey: .spacing)
        try container.encode(self.typography, forKey: .typography)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case colors
        case colorScheme
        case components
        case images
        case spacing
        case typography
    }
}