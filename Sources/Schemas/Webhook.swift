import Foundation

public struct Webhook: Codable, Hashable, Sendable {
    public let createdAt: Date?
    public let events: [String]
    public let id: String
    public let isActive: Bool
    public let recentDeliveries: [[String: JSONValue]]?
    public let secret: String?
    public let updatedAt: Date?
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date? = nil,
        events: [String],
        id: String,
        isActive: Bool,
        recentDeliveries: [[String: JSONValue]]? = nil,
        secret: String? = nil,
        updatedAt: Date? = nil,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.events = events
        self.id = id
        self.isActive = isActive
        self.recentDeliveries = recentDeliveries
        self.secret = secret
        self.updatedAt = updatedAt
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decodeIfPresent(Date.self, forKey: .createdAt)
        self.events = try container.decode([String].self, forKey: .events)
        self.id = try container.decode(String.self, forKey: .id)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.recentDeliveries = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .recentDeliveries)
        self.secret = try container.decodeIfPresent(String.self, forKey: .secret)
        self.updatedAt = try container.decodeIfPresent(Date.self, forKey: .updatedAt)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.createdAt, forKey: .createdAt)
        try container.encode(self.events, forKey: .events)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.isActive, forKey: .isActive)
        try container.encodeIfPresent(self.recentDeliveries, forKey: .recentDeliveries)
        try container.encodeIfPresent(self.secret, forKey: .secret)
        try container.encodeIfPresent(self.updatedAt, forKey: .updatedAt)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt
        case events
        case id
        case isActive
        case recentDeliveries
        case secret
        case updatedAt
        case url
    }
}