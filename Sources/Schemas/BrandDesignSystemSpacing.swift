import Foundation

public struct BrandDesignSystemSpacing: Codable, Hashable, Sendable {
    public let baseUnit: Double
    public let borderRadius: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        baseUnit: Double,
        borderRadius: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.baseUnit = baseUnit
        self.borderRadius = borderRadius
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.baseUnit = try container.decode(Double.self, forKey: .baseUnit)
        self.borderRadius = try container.decodeIfPresent(String.self, forKey: .borderRadius)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.baseUnit, forKey: .baseUnit)
        try container.encodeIfPresent(self.borderRadius, forKey: .borderRadius)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case baseUnit
        case borderRadius
    }
}