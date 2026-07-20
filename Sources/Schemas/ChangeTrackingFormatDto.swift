import Foundation

public struct ChangeTrackingFormatDto: Codable, Hashable, Sendable {
    /// Change detection modes
    public let modes: [String]?
    /// Schema for structured change tracking
    public let schema: [String: JSONValue]?
    /// Tag to identify this tracking session
    public let tag: String?
    /// Format type
    public let type: ChangeTrackingFormatDtoType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        modes: [String]? = nil,
        schema: [String: JSONValue]? = nil,
        tag: String? = nil,
        type: ChangeTrackingFormatDtoType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.modes = modes
        self.schema = schema
        self.tag = tag
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.modes = try container.decodeIfPresent([String].self, forKey: .modes)
        self.schema = try container.decodeIfPresent([String: JSONValue].self, forKey: .schema)
        self.tag = try container.decodeIfPresent(String.self, forKey: .tag)
        self.type = try container.decode(ChangeTrackingFormatDtoType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.modes, forKey: .modes)
        try container.encodeIfPresent(self.schema, forKey: .schema)
        try container.encodeIfPresent(self.tag, forKey: .tag)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case modes
        case schema
        case tag
        case type
    }
}