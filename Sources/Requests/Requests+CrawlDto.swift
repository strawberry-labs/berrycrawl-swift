import Foundation

extension Requests {
    public struct CrawlDto: Codable, Hashable, Sendable {
        /// Whether to allow crawling external domains
        public let allowExternalLinks: Bool?
        /// Whether to allow crawling subdomains
        public let allowSubdomains: Bool?
        /// Whether to crawl entire domain or just subtree
        public let crawlEntireDomain: Bool?
        /// Deduplicate similar URLs using intelligent matching
        public let deduplicateSimilarUrLs: Bool?
        /// Delay between page scrapes in milliseconds
        public let delay: Double?
        /// Regex patterns to exclude paths
        public let excludePaths: [String]?
        /// Ignore query parameters when deduplicating URLs
        public let ignoreQueryParameters: Bool?
        /// Regex patterns to include paths
        public let includePaths: [String]?
        /// Maximum number of pages to crawl
        public let limit: Double?
        /// Maximum number of concurrent scrapes for this crawl
        public let maxConcurrency: Double?
        /// Maximum depth for URL discovery
        public let maxDiscoveryDepth: Double?
        /// Natural language instructions for crawl configuration
        public let prompt: String?
        /// Scrape options to apply to each page. actions accepts at most 25 bounded browser actions. zeroDataRetention: true is currently rejected with 400 ZERO_DATA_RETENTION_NOT_SUPPORTED.
        public let scrapeOptions: [String: JSONValue]?
        /// Sitemap handling strategy
        public let sitemap: CrawlDtoSitemap?
        /// Starting URL to crawl
        public let url: String
        /// Webhook configuration
        public let webhook: WebhookConfigDto?
        /// Reserved for a future zero-data-retention mode. true is currently rejected with 400 ZERO_DATA_RETENTION_NOT_SUPPORTED; omit or use false.
        public let zeroDataRetention: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            allowExternalLinks: Bool? = nil,
            allowSubdomains: Bool? = nil,
            crawlEntireDomain: Bool? = nil,
            deduplicateSimilarUrLs: Bool? = nil,
            delay: Double? = nil,
            excludePaths: [String]? = nil,
            ignoreQueryParameters: Bool? = nil,
            includePaths: [String]? = nil,
            limit: Double? = nil,
            maxConcurrency: Double? = nil,
            maxDiscoveryDepth: Double? = nil,
            prompt: String? = nil,
            scrapeOptions: [String: JSONValue]? = nil,
            sitemap: CrawlDtoSitemap? = nil,
            url: String,
            webhook: WebhookConfigDto? = nil,
            zeroDataRetention: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.allowExternalLinks = allowExternalLinks
            self.allowSubdomains = allowSubdomains
            self.crawlEntireDomain = crawlEntireDomain
            self.deduplicateSimilarUrLs = deduplicateSimilarUrLs
            self.delay = delay
            self.excludePaths = excludePaths
            self.ignoreQueryParameters = ignoreQueryParameters
            self.includePaths = includePaths
            self.limit = limit
            self.maxConcurrency = maxConcurrency
            self.maxDiscoveryDepth = maxDiscoveryDepth
            self.prompt = prompt
            self.scrapeOptions = scrapeOptions
            self.sitemap = sitemap
            self.url = url
            self.webhook = webhook
            self.zeroDataRetention = zeroDataRetention
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.allowExternalLinks = try container.decodeIfPresent(Bool.self, forKey: .allowExternalLinks)
            self.allowSubdomains = try container.decodeIfPresent(Bool.self, forKey: .allowSubdomains)
            self.crawlEntireDomain = try container.decodeIfPresent(Bool.self, forKey: .crawlEntireDomain)
            self.deduplicateSimilarUrLs = try container.decodeIfPresent(Bool.self, forKey: .deduplicateSimilarUrLs)
            self.delay = try container.decodeIfPresent(Double.self, forKey: .delay)
            self.excludePaths = try container.decodeIfPresent([String].self, forKey: .excludePaths)
            self.ignoreQueryParameters = try container.decodeIfPresent(Bool.self, forKey: .ignoreQueryParameters)
            self.includePaths = try container.decodeIfPresent([String].self, forKey: .includePaths)
            self.limit = try container.decodeIfPresent(Double.self, forKey: .limit)
            self.maxConcurrency = try container.decodeIfPresent(Double.self, forKey: .maxConcurrency)
            self.maxDiscoveryDepth = try container.decodeIfPresent(Double.self, forKey: .maxDiscoveryDepth)
            self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
            self.scrapeOptions = try container.decodeIfPresent([String: JSONValue].self, forKey: .scrapeOptions)
            self.sitemap = try container.decodeIfPresent(CrawlDtoSitemap.self, forKey: .sitemap)
            self.url = try container.decode(String.self, forKey: .url)
            self.webhook = try container.decodeIfPresent(WebhookConfigDto.self, forKey: .webhook)
            self.zeroDataRetention = try container.decodeIfPresent(Bool.self, forKey: .zeroDataRetention)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.allowExternalLinks, forKey: .allowExternalLinks)
            try container.encodeIfPresent(self.allowSubdomains, forKey: .allowSubdomains)
            try container.encodeIfPresent(self.crawlEntireDomain, forKey: .crawlEntireDomain)
            try container.encodeIfPresent(self.deduplicateSimilarUrLs, forKey: .deduplicateSimilarUrLs)
            try container.encodeIfPresent(self.delay, forKey: .delay)
            try container.encodeIfPresent(self.excludePaths, forKey: .excludePaths)
            try container.encodeIfPresent(self.ignoreQueryParameters, forKey: .ignoreQueryParameters)
            try container.encodeIfPresent(self.includePaths, forKey: .includePaths)
            try container.encodeIfPresent(self.limit, forKey: .limit)
            try container.encodeIfPresent(self.maxConcurrency, forKey: .maxConcurrency)
            try container.encodeIfPresent(self.maxDiscoveryDepth, forKey: .maxDiscoveryDepth)
            try container.encodeIfPresent(self.prompt, forKey: .prompt)
            try container.encodeIfPresent(self.scrapeOptions, forKey: .scrapeOptions)
            try container.encodeIfPresent(self.sitemap, forKey: .sitemap)
            try container.encode(self.url, forKey: .url)
            try container.encodeIfPresent(self.webhook, forKey: .webhook)
            try container.encodeIfPresent(self.zeroDataRetention, forKey: .zeroDataRetention)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case allowExternalLinks
            case allowSubdomains
            case crawlEntireDomain
            case deduplicateSimilarUrLs = "deduplicateSimilarURLs"
            case delay
            case excludePaths
            case ignoreQueryParameters
            case includePaths
            case limit
            case maxConcurrency
            case maxDiscoveryDepth
            case prompt
            case scrapeOptions
            case sitemap
            case url
            case webhook
            case zeroDataRetention
        }
    }
}