import Foundation

public struct CancelJobResponse: Codable, Hashable, Sendable {
    public let data: CancelJobResponseData
    public let success: Bool
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        data: CancelJobResponseData,
        success: Bool,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.data = data
        self.success = success
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.data = try container.decode(CancelJobResponseData.self, forKey: .data)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.data, forKey: .data)
        try container.encode(self.success, forKey: .success)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case data
        case success
    }
}