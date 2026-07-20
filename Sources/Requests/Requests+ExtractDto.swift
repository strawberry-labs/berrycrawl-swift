import Foundation

extension Requests {
    public struct ExtractDto: Codable, Hashable, Sendable {
        /// Agent configuration
        public let agent: AgentConfigDto?
        /// Enable web search for URL discovery
        public let enableWebSearch: Bool?
        /// Ignore invalid URLs and process remaining valid ones
        public let ignoreInvalidUrLs: Bool?
        /// Ignore sitemap during URL discovery
        public let ignoreSitemap: Bool?
        /// Include subdomains in extraction
        public let includeSubdomains: Bool?
        /// Natural language prompt describing what to extract. Maximum 16384 UTF-8 bytes.
        public let prompt: String
        /// JSON Schema for structured output. Serialized schema is limited to 65536 UTF-8 bytes.
        public let schema: [String: JSONValue]?
        /// Scrape options for each URL. zeroDataRetention: true is currently rejected with 400 ZERO_DATA_RETENTION_NOT_SUPPORTED.
        public let scrapeOptions: [String: JSONValue]?
        /// Include source citations in response
        public let showSources: Bool?
        /// 1–20 unique public HTTP(S) URLs. May be omitted only when enableWebSearch is true. Each URL is limited to 2048 UTF-8 bytes.
        public let urls: [String]?
        /// Webhook configuration
        public let webhook: ExtractWebhookConfigDto?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            agent: AgentConfigDto? = nil,
            enableWebSearch: Bool? = nil,
            ignoreInvalidUrLs: Bool? = nil,
            ignoreSitemap: Bool? = nil,
            includeSubdomains: Bool? = nil,
            prompt: String,
            schema: [String: JSONValue]? = nil,
            scrapeOptions: [String: JSONValue]? = nil,
            showSources: Bool? = nil,
            urls: [String]? = nil,
            webhook: ExtractWebhookConfigDto? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.agent = agent
            self.enableWebSearch = enableWebSearch
            self.ignoreInvalidUrLs = ignoreInvalidUrLs
            self.ignoreSitemap = ignoreSitemap
            self.includeSubdomains = includeSubdomains
            self.prompt = prompt
            self.schema = schema
            self.scrapeOptions = scrapeOptions
            self.showSources = showSources
            self.urls = urls
            self.webhook = webhook
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.agent = try container.decodeIfPresent(AgentConfigDto.self, forKey: .agent)
            self.enableWebSearch = try container.decodeIfPresent(Bool.self, forKey: .enableWebSearch)
            self.ignoreInvalidUrLs = try container.decodeIfPresent(Bool.self, forKey: .ignoreInvalidUrLs)
            self.ignoreSitemap = try container.decodeIfPresent(Bool.self, forKey: .ignoreSitemap)
            self.includeSubdomains = try container.decodeIfPresent(Bool.self, forKey: .includeSubdomains)
            self.prompt = try container.decode(String.self, forKey: .prompt)
            self.schema = try container.decodeIfPresent([String: JSONValue].self, forKey: .schema)
            self.scrapeOptions = try container.decodeIfPresent([String: JSONValue].self, forKey: .scrapeOptions)
            self.showSources = try container.decodeIfPresent(Bool.self, forKey: .showSources)
            self.urls = try container.decodeIfPresent([String].self, forKey: .urls)
            self.webhook = try container.decodeIfPresent(ExtractWebhookConfigDto.self, forKey: .webhook)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.agent, forKey: .agent)
            try container.encodeIfPresent(self.enableWebSearch, forKey: .enableWebSearch)
            try container.encodeIfPresent(self.ignoreInvalidUrLs, forKey: .ignoreInvalidUrLs)
            try container.encodeIfPresent(self.ignoreSitemap, forKey: .ignoreSitemap)
            try container.encodeIfPresent(self.includeSubdomains, forKey: .includeSubdomains)
            try container.encode(self.prompt, forKey: .prompt)
            try container.encodeIfPresent(self.schema, forKey: .schema)
            try container.encodeIfPresent(self.scrapeOptions, forKey: .scrapeOptions)
            try container.encodeIfPresent(self.showSources, forKey: .showSources)
            try container.encodeIfPresent(self.urls, forKey: .urls)
            try container.encodeIfPresent(self.webhook, forKey: .webhook)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case agent
            case enableWebSearch
            case ignoreInvalidUrLs = "ignoreInvalidURLs"
            case ignoreSitemap
            case includeSubdomains
            case prompt
            case schema
            case scrapeOptions
            case showSources
            case urls
            case webhook
        }
    }
}