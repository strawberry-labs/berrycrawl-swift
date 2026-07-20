import Foundation

public struct BrandResponseData: Codable, Hashable, Sendable {
    public let brand: BrandProfile
    public let meta: BrandResponseDataMeta
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        brand: BrandProfile,
        meta: BrandResponseDataMeta,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.brand = brand
        self.meta = meta
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.brand = try container.decode(BrandProfile.self, forKey: .brand)
        self.meta = try container.decode(BrandResponseDataMeta.self, forKey: .meta)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.brand, forKey: .brand)
        try container.encode(self.meta, forKey: .meta)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case brand
        case meta
    }
}