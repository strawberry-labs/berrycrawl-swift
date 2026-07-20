import Foundation

public struct TestWebhookResponse: Codable, Hashable, Sendable {
    public let event: String
    public let message: String
    public let payload: [String: JSONValue]
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        event: String,
        message: String,
        payload: [String: JSONValue],
        success: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.event = event
        self.message = message
        self.payload = payload
        self.success = success
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.event = try container.decode(String.self, forKey: .event)
        self.message = try container.decode(String.self, forKey: .message)
        self.payload = try container.decode([String: JSONValue].self, forKey: .payload)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.event, forKey: .event)
        try container.encode(self.message, forKey: .message)
        try container.encode(self.payload, forKey: .payload)
        try container.encode(self.success, forKey: .success)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case event
        case message
        case payload
        case success
    }
}