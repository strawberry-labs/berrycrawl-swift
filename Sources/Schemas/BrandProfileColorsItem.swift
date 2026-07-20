import Foundation

public struct BrandProfileColorsItem: Codable, Hashable, Sendable {
    public let hex: String
    public let name: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        hex: String,
        name: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.hex = hex
        self.name = name
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.hex = try container.decode(String.self, forKey: .hex)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.hex, forKey: .hex)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case hex
        case name
    }
}