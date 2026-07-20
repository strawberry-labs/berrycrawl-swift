import Foundation

public struct BrandComponentStyle: Codable, Hashable, Sendable {
    public let background: String?
    public let borderColor: String?
    public let borderRadius: String?
    public let shadow: String?
    public let textColor: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        background: String? = nil,
        borderColor: String? = nil,
        borderRadius: String? = nil,
        shadow: String? = nil,
        textColor: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.background = background
        self.borderColor = borderColor
        self.borderRadius = borderRadius
        self.shadow = shadow
        self.textColor = textColor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.background = try container.decodeIfPresent(String.self, forKey: .background)
        self.borderColor = try container.decodeIfPresent(String.self, forKey: .borderColor)
        self.borderRadius = try container.decodeIfPresent(String.self, forKey: .borderRadius)
        self.shadow = try container.decodeIfPresent(String.self, forKey: .shadow)
        self.textColor = try container.decodeIfPresent(String.self, forKey: .textColor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.background, forKey: .background)
        try container.encodeIfPresent(self.borderColor, forKey: .borderColor)
        try container.encodeIfPresent(self.borderRadius, forKey: .borderRadius)
        try container.encodeIfPresent(self.shadow, forKey: .shadow)
        try container.encodeIfPresent(self.textColor, forKey: .textColor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case background
        case borderColor
        case borderRadius
        case shadow
        case textColor
    }
}