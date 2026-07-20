import Foundation

public struct BrandProfileSocialsItem: Codable, Hashable, Sendable {
    public let network: String
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        network: String,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.network = network
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.network = try container.decode(String.self, forKey: .network)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.network, forKey: .network)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case network
        case url
    }
}