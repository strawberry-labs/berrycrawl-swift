import Foundation

public struct JobResponseDataErrorsItem: Codable, Hashable, Sendable {
    public let error: String?
    public let url: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        error: String? = nil,
        url: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.error = error
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case error
        case url
    }
}