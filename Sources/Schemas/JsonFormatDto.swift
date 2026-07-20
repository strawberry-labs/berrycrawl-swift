import Foundation

public struct JsonFormatDto: Codable, Hashable, Sendable {
    /// Natural language prompt for extraction guidance
    public let prompt: String?
    /// JSON schema for structured extraction
    public let schema: [String: JSONValue]
    /// Format type
    public let type: JsonFormatDtoType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        prompt: String? = nil,
        schema: [String: JSONValue],
        type: JsonFormatDtoType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.prompt = prompt
        self.schema = schema
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.prompt = try container.decodeIfPresent(String.self, forKey: .prompt)
        self.schema = try container.decode([String: JSONValue].self, forKey: .schema)
        self.type = try container.decode(JsonFormatDtoType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.prompt, forKey: .prompt)
        try container.encode(self.schema, forKey: .schema)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case prompt
        case schema
        case type
    }
}