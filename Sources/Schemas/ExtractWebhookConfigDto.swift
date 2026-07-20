import Foundation

public struct ExtractWebhookConfigDto: Codable, Hashable, Sendable {
    /// Events to subscribe to
    public let events: [String]?
    /// Custom metadata
    public let metadata: [String: JSONValue]?
    /// Optional secret used to sign direct webhook deliveries
    public let secret: String?
    /// Webhook URL
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        events: [String]? = nil,
        metadata: [String: JSONValue]? = nil,
        secret: String? = nil,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.events = events
        self.metadata = metadata
        self.secret = secret
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.events = try container.decodeIfPresent([String].self, forKey: .events)
        self.metadata = try container.decodeIfPresent([String: JSONValue].self, forKey: .metadata)
        self.secret = try container.decodeIfPresent(String.self, forKey: .secret)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.events, forKey: .events)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.secret, forKey: .secret)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case events
        case metadata
        case secret
        case url
    }
}