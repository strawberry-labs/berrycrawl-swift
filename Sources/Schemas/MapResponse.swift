import Foundation

public struct MapResponse: Codable, Hashable, Sendable {
    public let creditsUsed: Int
    public let links: [MapLink]
    public let success: Bool
    public let total: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        creditsUsed: Int,
        links: [MapLink],
        success: Bool,
        total: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.creditsUsed = creditsUsed
        self.links = links
        self.success = success
        self.total = total
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.creditsUsed = try container.decode(Int.self, forKey: .creditsUsed)
        self.links = try container.decode([MapLink].self, forKey: .links)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.total = try container.decode(Int.self, forKey: .total)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.creditsUsed, forKey: .creditsUsed)
        try container.encode(self.links, forKey: .links)
        try container.encode(self.success, forKey: .success)
        try container.encode(self.total, forKey: .total)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case creditsUsed
        case links
        case success
        case total
    }
}