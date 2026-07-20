import Foundation

extension Requests {
    public struct SearchDto: Codable, Hashable, Sendable {
        /// Category filters
        public let categories: [String]?
        /// Country code
        public let country: String?
        /// Maximum number of results
        public let limit: Double?
        /// Location for geo-targeting
        public let location: String?
        /// Search query
        public let query: String
        /// Source types to search
        public let sources: [String]?
        /// Time-based filter (e.g., qdr:d for past day)
        public let tbs: String?
        /// Timeout for search operation in milliseconds
        public let timeout: Double?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            categories: [String]? = nil,
            country: String? = nil,
            limit: Double? = nil,
            location: String? = nil,
            query: String,
            sources: [String]? = nil,
            tbs: String? = nil,
            timeout: Double? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.categories = categories
            self.country = country
            self.limit = limit
            self.location = location
            self.query = query
            self.sources = sources
            self.tbs = tbs
            self.timeout = timeout
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.categories = try container.decodeIfPresent([String].self, forKey: .categories)
            self.country = try container.decodeIfPresent(String.self, forKey: .country)
            self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
            self.location = try container.decodeIfPresent(String.self, forKey: .location)
            self.query = try container.decode(String.self, forKey: .query)
            self.sources = try container.decodeIfPresent([String].self, forKey: .sources)
            self.tbs = try container.decodeIfPresent(String.self, forKey: .tbs)
            self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.categories, forKey: .categories)
            try container.encodeIfPresent(self.country, forKey: .country)
            try container.encodeIfPresent(self.limit, forKey: .limit)
            try container.encodeIfPresent(self.location, forKey: .location)
            try container.encode(self.query, forKey: .query)
            try container.encodeIfPresent(self.sources, forKey: .sources)
            try container.encodeIfPresent(self.tbs, forKey: .tbs)
            try container.encodeIfPresent(self.timeout, forKey: .timeout)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case categories
            case country
            case limit
            case location
            case query
            case sources
            case tbs
            case timeout
        }
    }
}