import Foundation

extension Requests {
    public struct TestWebhookDto: Codable, Hashable, Sendable {
        /// Event type to test
        public let event: String
        /// Optional custom payload for testing
        public let payload: [String: JSONValue]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            event: String,
            payload: [String: JSONValue]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.event = event
            self.payload = payload
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.event = try container.decode(String.self, forKey: .event)
            self.payload = try container.decodeIfPresent([String: JSONValue].self, forKey: .payload)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.event, forKey: .event)
            try container.encodeIfPresent(self.payload, forKey: .payload)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case event
            case payload
        }
    }
}