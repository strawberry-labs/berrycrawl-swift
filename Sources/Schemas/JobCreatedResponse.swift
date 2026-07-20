import Foundation

public struct JobCreatedResponse: Codable, Hashable, Sendable {
    public let id: String
    public let invalidUrLs: [String]?
    public let success: Bool
    public let url: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        id: String,
        invalidUrLs: [String]? = nil,
        success: Bool,
        url: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.id = id
        self.invalidUrLs = invalidUrLs
        self.success = success
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.invalidUrLs = try container.decodeIfPresent([String].self, forKey: .invalidUrLs)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.url = try container.decode(String.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.id, forKey: .id)
        try container.encodeIfPresent(self.invalidUrLs, forKey: .invalidUrLs)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case invalidUrLs = "invalidURLs"
        case success
        case url
    }
}