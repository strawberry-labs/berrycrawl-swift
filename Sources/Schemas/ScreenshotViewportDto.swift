import Foundation

public struct ScreenshotViewportDto: Codable, Hashable, Sendable {
    public let height: Double
    public let width: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        height: Double,
        width: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.height = height
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.height = try container.decode(Double.self, forKey: .height)
        self.width = try container.decode(Double.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.height, forKey: .height)
        try container.encode(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case height
        case width
    }
}