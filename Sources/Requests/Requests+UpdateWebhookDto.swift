import Foundation

extension Requests {
    public struct UpdateWebhookDto: Codable, Hashable, Sendable {
        /// Event types to subscribe to
        public let events: [String]?
        /// Enable or disable webhook
        public let isActive: Bool?
        /// Webhook URL to send events to
        public let url: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            events: [String]? = nil,
            isActive: Bool? = nil,
            url: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.events = events
            self.isActive = isActive
            self.url = url
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.events = try container.decodeIfPresent([String].self, forKey: .events)
            self.isActive = try container.decodeIfPresent(Bool.self, forKey: .isActive)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.events, forKey: .events)
            try container.encodeIfPresent(self.isActive, forKey: .isActive)
            try container.encodeIfPresent(self.url, forKey: .url)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case events
            case isActive
            case url
        }
    }
}