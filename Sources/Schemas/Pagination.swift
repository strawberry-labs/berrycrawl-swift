import Foundation

public struct Pagination: Codable, Hashable, Sendable {
    public let limit: Int
    public let page: Int
    public let total: Int
    public let totalPages: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        limit: Int,
        page: Int,
        total: Int,
        totalPages: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.limit = limit
        self.page = page
        self.total = total
        self.totalPages = totalPages
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.limit = try container.decode(Int.self, forKey: .limit)
        self.page = try container.decode(Int.self, forKey: .page)
        self.total = try container.decode(Int.self, forKey: .total)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.limit, forKey: .limit)
        try container.encode(self.page, forKey: .page)
        try container.encode(self.total, forKey: .total)
        try container.encodeIfPresent(self.totalPages, forKey: .totalPages)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case limit
        case page
        case total
        case totalPages
    }
}