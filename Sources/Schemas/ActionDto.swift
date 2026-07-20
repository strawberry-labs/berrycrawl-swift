import Foundation

public struct ActionDto: Codable, Hashable, Sendable {
    public let amount: Double?
    public let direction: ActionDtoDirection?
    public let key: String?
    public let milliseconds: Double?
    public let selector: String?
    public let text: String?
    public let type: ActionDtoType
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        amount: Double? = nil,
        direction: ActionDtoDirection? = nil,
        key: String? = nil,
        milliseconds: Double? = nil,
        selector: String? = nil,
        text: String? = nil,
        type: ActionDtoType,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.amount = amount
        self.direction = direction
        self.key = key
        self.milliseconds = milliseconds
        self.selector = selector
        self.text = text
        self.type = type
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.amount = try container.decodeIfPresent(Double.self, forKey: .amount)
        self.direction = try container.decodeIfPresent(ActionDtoDirection.self, forKey: .direction)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.milliseconds = try container.decodeIfPresent(Double.self, forKey: .milliseconds)
        self.selector = try container.decodeIfPresent(String.self, forKey: .selector)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.type = try container.decode(ActionDtoType.self, forKey: .type)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.direction, forKey: .direction)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.milliseconds, forKey: .milliseconds)
        try container.encodeIfPresent(self.selector, forKey: .selector)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encode(self.type, forKey: .type)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case direction
        case key
        case milliseconds
        case selector
        case text
        case type
    }
}