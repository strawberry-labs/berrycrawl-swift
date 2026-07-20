import Foundation

extension Requests {
    public struct ParseDto: Codable, Hashable, Sendable {
        public let timeout: Double?
        /// Public PDF, Word document, or spreadsheet URL
        public let url: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            timeout: Double? = nil,
            url: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.timeout = timeout
            self.url = url
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
            self.url = try container.decode(String.self, forKey: .url)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.timeout, forKey: .timeout)
            try container.encode(self.url, forKey: .url)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case timeout
            case url
        }
    }
}