import Foundation

public struct BrandDesignSystemColors: Codable, Hashable, Sendable {
    public let accent: String?
    public let background: String?
    public let link: String?
    public let primary: String?
    public let secondary: String?
    public let textPrimary: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        accent: String? = nil,
        background: String? = nil,
        link: String? = nil,
        primary: String? = nil,
        secondary: String? = nil,
        textPrimary: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.accent = accent
        self.background = background
        self.link = link
        self.primary = primary
        self.secondary = secondary
        self.textPrimary = textPrimary
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accent = try container.decodeIfPresent(String.self, forKey: .accent)
        self.background = try container.decodeIfPresent(String.self, forKey: .background)
        self.link = try container.decodeIfPresent(String.self, forKey: .link)
        self.primary = try container.decodeIfPresent(String.self, forKey: .primary)
        self.secondary = try container.decodeIfPresent(String.self, forKey: .secondary)
        self.textPrimary = try container.decodeIfPresent(String.self, forKey: .textPrimary)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.accent, forKey: .accent)
        try container.encodeIfPresent(self.background, forKey: .background)
        try container.encodeIfPresent(self.link, forKey: .link)
        try container.encodeIfPresent(self.primary, forKey: .primary)
        try container.encodeIfPresent(self.secondary, forKey: .secondary)
        try container.encodeIfPresent(self.textPrimary, forKey: .textPrimary)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case accent
        case background
        case link
        case primary
        case secondary
        case textPrimary
    }
}