import Foundation

public struct AgentConfigDto: Codable, Hashable, Sendable {
    /// Model routing mode. "default" uses the fast default model; "smart" uses the higher-latency reasoning model.
    public let mode: AgentConfigDtoMode?
    /// Explicit AI model to use. Omit for the configured default, or set "smart" to use the configured smart model.
    public let model: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mode: AgentConfigDtoMode? = nil,
        model: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mode = mode
        self.model = model
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mode = try container.decodeIfPresent(AgentConfigDtoMode.self, forKey: .mode)
        self.model = try container.decodeIfPresent(String.self, forKey: .model)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.model, forKey: .model)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mode
        case model
    }
}