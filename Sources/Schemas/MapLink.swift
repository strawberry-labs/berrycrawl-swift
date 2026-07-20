import Foundation

public struct MapLink: Codable, Hashable, Sendable {
    public let description: String?
    public let title: String?
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        description: String? = nil,
        title: String? = nil,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.description = description
        self.title = title
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case description
        case title
        case url
    }
}