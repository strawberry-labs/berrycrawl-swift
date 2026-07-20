import Foundation

public struct BrandAsset: Codable, Hashable, Sendable {
    public let height: Int?
    public let theme: String?
    public let type: String
    public let url: String
    public let width: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        height: Int? = nil,
        theme: String? = nil,
        type: String,
        url: String,
        width: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.height = height
        self.theme = theme
        self.type = type
        self.url = url
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.theme = try container.decodeIfPresent(String.self, forKey: .theme)
        self.type = try container.decode(String.self, forKey: .type)
        self.url = try container.decode(String.self, forKey: .url)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.theme, forKey: .theme)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case height
        case theme
        case type
        case url
        case width
    }
}