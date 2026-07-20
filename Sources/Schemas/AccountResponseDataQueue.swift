import Foundation

public struct AccountResponseDataQueue: Codable, Hashable, Sendable {
    public let active: Int
    public let waiting: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        active: Int,
        waiting: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.active = active
        self.waiting = waiting
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.active = try container.decode(Int.self, forKey: .active)
        self.waiting = try container.decode(Int.self, forKey: .waiting)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.active, forKey: .active)
        try container.encode(self.waiting, forKey: .waiting)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case active
        case waiting
    }
}