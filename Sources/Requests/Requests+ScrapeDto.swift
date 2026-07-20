import Foundation

extension Requests {
    public struct ScrapeDto: Codable, Hashable, Sendable {
        /// Browser actions to execute
        public let actions: [ActionDto]?
        /// Enable ad-blocking and cookie popup blocking
        public let blockAds: Bool?
        /// Domain to scrape. Normalized to https://domain when url is omitted.
        public let domain: String?
        /// CSS selectors to exclude
        public let excludeTags: [String]?
        /// Schema for structured data extraction (used with json format)
        public let extractionSchema: [String: JSONValue]?
        /// Output formats - can be simple strings or format objects with options
        public let formats: [ScrapeDtoFormatsItem]?
        /// Custom headers
        public let headers: [String: JSONValue]?
        /// CSS selectors to include
        public let includeTags: [String]?
        /// Location settings
        public let location: LocationDto?
        /// Cache max age in milliseconds
        public let maxAge: Double?
        /// Emulate mobile device for scraping
        public let mobile: Bool?
        /// Extract only main content
        public let onlyMainContent: Bool?
        /// Proxy mode. auto starts direct and escalates only when blocked. basic is an alias for none.
        public let proxy: ScrapeDtoProxy?
        /// Remove base64 images from output (keeps alt text)
        public let removeBase64Images: Bool?
        /// Return screenshot/PDF output inline as a base64 data URL instead of an uploaded CDN URL. Default false (a CDN URL is returned).
        public let screenshotAsBase64: Bool?
        /// Skip TLS certificate verification
        public let skipTlsVerification: Bool?
        /// Store result in cache
        public let storeInCache: Bool?
        /// Request timeout in milliseconds
        public let timeout: Double?
        /// URL to scrape. Either url or domain is required.
        public let url: String?
        /// Wait time before scraping (ms)
        public let waitFor: Double?
        /// Reserved for a future zero-data-retention mode. true is currently rejected with 400 ZERO_DATA_RETENTION_NOT_SUPPORTED; omit or use false.
        public let zeroDataRetention: Bool?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            actions: [ActionDto]? = nil,
            blockAds: Bool? = nil,
            domain: String? = nil,
            excludeTags: [String]? = nil,
            extractionSchema: [String: JSONValue]? = nil,
            formats: [ScrapeDtoFormatsItem]? = nil,
            headers: [String: JSONValue]? = nil,
            includeTags: [String]? = nil,
            location: LocationDto? = nil,
            maxAge: Double? = nil,
            mobile: Bool? = nil,
            onlyMainContent: Bool? = nil,
            proxy: ScrapeDtoProxy? = nil,
            removeBase64Images: Bool? = nil,
            screenshotAsBase64: Bool? = nil,
            skipTlsVerification: Bool? = nil,
            storeInCache: Bool? = nil,
            timeout: Double? = nil,
            url: String? = nil,
            waitFor: Double? = nil,
            zeroDataRetention: Bool? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.actions = actions
            self.blockAds = blockAds
            self.domain = domain
            self.excludeTags = excludeTags
            self.extractionSchema = extractionSchema
            self.formats = formats
            self.headers = headers
            self.includeTags = includeTags
            self.location = location
            self.maxAge = maxAge
            self.mobile = mobile
            self.onlyMainContent = onlyMainContent
            self.proxy = proxy
            self.removeBase64Images = removeBase64Images
            self.screenshotAsBase64 = screenshotAsBase64
            self.skipTlsVerification = skipTlsVerification
            self.storeInCache = storeInCache
            self.timeout = timeout
            self.url = url
            self.waitFor = waitFor
            self.zeroDataRetention = zeroDataRetention
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.actions = try container.decodeIfPresent([ActionDto].self, forKey: .actions)
            self.blockAds = try container.decodeIfPresent(Bool.self, forKey: .blockAds)
            self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
            self.excludeTags = try container.decodeIfPresent([String].self, forKey: .excludeTags)
            self.extractionSchema = try container.decodeIfPresent([String: JSONValue].self, forKey: .extractionSchema)
            self.formats = try container.decodeIfPresent([ScrapeDtoFormatsItem].self, forKey: .formats)
            self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
            self.includeTags = try container.decodeIfPresent([String].self, forKey: .includeTags)
            self.location = try container.decodeIfPresent(LocationDto.self, forKey: .location)
            self.maxAge = try container.decodeIfPresent(Double.self, forKey: .maxAge)
            self.mobile = try container.decodeIfPresent(Bool.self, forKey: .mobile)
            self.onlyMainContent = try container.decodeIfPresent(Bool.self, forKey: .onlyMainContent)
            self.proxy = try container.decodeIfPresent(ScrapeDtoProxy.self, forKey: .proxy)
            self.removeBase64Images = try container.decodeIfPresent(Bool.self, forKey: .removeBase64Images)
            self.screenshotAsBase64 = try container.decodeIfPresent(Bool.self, forKey: .screenshotAsBase64)
            self.skipTlsVerification = try container.decodeIfPresent(Bool.self, forKey: .skipTlsVerification)
            self.storeInCache = try container.decodeIfPresent(Bool.self, forKey: .storeInCache)
            self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
            self.url = try container.decodeIfPresent(String.self, forKey: .url)
            self.waitFor = try container.decodeIfPresent(Double.self, forKey: .waitFor)
            self.zeroDataRetention = try container.decodeIfPresent(Bool.self, forKey: .zeroDataRetention)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.actions, forKey: .actions)
            try container.encodeIfPresent(self.blockAds, forKey: .blockAds)
            try container.encodeIfPresent(self.domain, forKey: .domain)
            try container.encodeIfPresent(self.excludeTags, forKey: .excludeTags)
            try container.encodeIfPresent(self.extractionSchema, forKey: .extractionSchema)
            try container.encodeIfPresent(self.formats, forKey: .formats)
            try container.encodeIfPresent(self.headers, forKey: .headers)
            try container.encodeIfPresent(self.includeTags, forKey: .includeTags)
            try container.encodeIfPresent(self.location, forKey: .location)
            try container.encodeIfPresent(self.maxAge, forKey: .maxAge)
            try container.encodeIfPresent(self.mobile, forKey: .mobile)
            try container.encodeIfPresent(self.onlyMainContent, forKey: .onlyMainContent)
            try container.encodeIfPresent(self.proxy, forKey: .proxy)
            try container.encodeIfPresent(self.removeBase64Images, forKey: .removeBase64Images)
            try container.encodeIfPresent(self.screenshotAsBase64, forKey: .screenshotAsBase64)
            try container.encodeIfPresent(self.skipTlsVerification, forKey: .skipTlsVerification)
            try container.encodeIfPresent(self.storeInCache, forKey: .storeInCache)
            try container.encodeIfPresent(self.timeout, forKey: .timeout)
            try container.encodeIfPresent(self.url, forKey: .url)
            try container.encodeIfPresent(self.waitFor, forKey: .waitFor)
            try container.encodeIfPresent(self.zeroDataRetention, forKey: .zeroDataRetention)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case actions
            case blockAds
            case domain
            case excludeTags
            case extractionSchema
            case formats
            case headers
            case includeTags
            case location
            case maxAge
            case mobile
            case onlyMainContent
            case proxy
            case removeBase64Images
            case screenshotAsBase64
            case skipTlsVerification
            case storeInCache
            case timeout
            case url
            case waitFor
            case zeroDataRetention
        }
    }
}