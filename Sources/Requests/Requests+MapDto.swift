import Foundation

extension Requests {
    public struct MapDto: Codable, Hashable, Sendable {
        /// Ignore query parameters when discovering URLs
        public let ignoreQueryParameters: Bool?
        /// Include subdomains in the map
        public let includeSubdomains: Bool?
        /// Maximum number of URLs to return
        public let limit: Double?
        /// Location configuration
        public let location: LocationDto?
        /// Search filter for URLs
        public let search: String?
        /// How to handle sitemaps
        public let sitemap: MapDtoSitemap?
        /// Timeout for map operation in milliseconds
        public let timeout: Double?
        /// URL to map
        public let url: String
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            ignoreQueryParameters: Bool? = nil,
            includeSubdomains: Bool? = nil,
            limit: Double? = nil,
            location: LocationDto? = nil,
            search: String? = nil,
            sitemap: MapDtoSitemap? = nil,
            timeout: Double? = nil,
            url: String,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.ignoreQueryParameters = ignoreQueryParameters
            self.includeSubdomains = includeSubdomains
            self.limit = limit
            self.location = location
            self.search = search
            self.sitemap = sitemap
            self.timeout = timeout
            self.url = url
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.ignoreQueryParameters = try container.decodeIfPresent(Bool.self, forKey: .ignoreQueryParameters)
            self.includeSubdomains = try container.decodeIfPresent(Bool.self, forKey: .includeSubdomains)
            self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
            self.location = try container.decodeIfPresent(LocationDto.self, forKey: .location)
            self.search = try container.decodeIfPresent(String.self, forKey: .search)
            self.sitemap = try container.decodeIfPresent(MapDtoSitemap.self, forKey: .sitemap)
            self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
            self.url = try container.decode(String.self, forKey: .url)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.ignoreQueryParameters, forKey: .ignoreQueryParameters)
            try container.encodeIfPresent(self.includeSubdomains, forKey: .includeSubdomains)
            try container.encodeIfPresent(self.limit, forKey: .limit)
            try container.encodeIfPresent(self.location, forKey: .location)
            try container.encodeIfPresent(self.search, forKey: .search)
            try container.encodeIfPresent(self.sitemap, forKey: .sitemap)
            try container.encodeIfPresent(self.timeout, forKey: .timeout)
            try container.encode(self.url, forKey: .url)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case ignoreQueryParameters
            case includeSubdomains
            case limit
            case location
            case search
            case sitemap
            case timeout
            case url
        }
    }
}