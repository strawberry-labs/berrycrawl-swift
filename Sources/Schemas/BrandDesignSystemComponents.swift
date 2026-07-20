import Foundation

public struct BrandDesignSystemComponents: Codable, Hashable, Sendable {
    public let buttonPrimary: BrandComponentStyle?
    public let buttonSecondary: BrandComponentStyle?
    public let input: BrandComponentStyle?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        buttonPrimary: BrandComponentStyle? = nil,
        buttonSecondary: BrandComponentStyle? = nil,
        input: BrandComponentStyle? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.buttonPrimary = buttonPrimary
        self.buttonSecondary = buttonSecondary
        self.input = input
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.buttonPrimary = try container.decodeIfPresent(BrandComponentStyle.self, forKey: .buttonPrimary)
        self.buttonSecondary = try container.decodeIfPresent(BrandComponentStyle.self, forKey: .buttonSecondary)
        self.input = try container.decodeIfPresent(BrandComponentStyle.self, forKey: .input)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.buttonPrimary, forKey: .buttonPrimary)
        try container.encodeIfPresent(self.buttonSecondary, forKey: .buttonSecondary)
        try container.encodeIfPresent(self.input, forKey: .input)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case buttonPrimary
        case buttonSecondary
        case input
    }
}