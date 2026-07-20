import Foundation

public struct SearchResult: Codable, Hashable, Sendable {
    public let provider: SearchResultProvider?
    public let publishedDate: Nullable<String>?
    public let snippet: String
    public let source: String
    public let title: String
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        provider: SearchResultProvider? = nil,
        publishedDate: Nullable<String>? = nil,
        snippet: String,
        source: String,
        title: String,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.provider = provider
        self.publishedDate = publishedDate
        self.snippet = snippet
        self.source = source
        self.title = title
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.provider = try container.decodeIfPresent(SearchResultProvider.self, forKey: .provider)
        self.publishedDate = try container.decodeNullableIfPresent(String.self, forKey: .publishedDate)
        self.snippet = try container.decode(String.self, forKey: .snippet)
        self.source = try container.decode(String.self, forKey: .source)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeNullableIfPresent(self.publishedDate, forKey: .publishedDate)
        try container.encode(self.snippet, forKey: .snippet)
        try container.encode(self.source, forKey: .source)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case provider
        case publishedDate
        case snippet
        case source
        case title
        case url
    }
}