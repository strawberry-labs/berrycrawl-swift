import Foundation

public struct ScrapeMetadata: Codable, Hashable, Sendable {
    public let contentType: String?
    public let statusCode: Int?
    public let timestamp: Date
    public let title: String?
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        contentType: String? = nil,
        statusCode: Int? = nil,
        timestamp: Date,
        title: String? = nil,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.contentType = contentType
        self.statusCode = statusCode
        self.timestamp = timestamp
        self.title = title
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.statusCode = try container.decodeIfPresent(Int.self, forKey: .statusCode)
        self.timestamp = try container.decode(Date.self, forKey: .timestamp)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
        try container.encodeIfPresent(self.statusCode, forKey: .statusCode)
        try container.encode(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case contentType
        case statusCode
        case timestamp
        case title
        case url
    }
}