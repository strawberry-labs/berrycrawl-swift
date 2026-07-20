import Foundation

public struct ScreenshotCookieDto: Codable, Hashable, Sendable {
    public let domain: String?
    public let httpOnly: Bool?
    public let name: String
    public let path: String?
    public let sameSite: ScreenshotCookieDtoSameSite?
    public let secure: Bool?
    public let value: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        domain: String? = nil,
        httpOnly: Bool? = nil,
        name: String,
        path: String? = nil,
        sameSite: ScreenshotCookieDtoSameSite? = nil,
        secure: Bool? = nil,
        value: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.domain = domain
        self.httpOnly = httpOnly
        self.name = name
        self.path = path
        self.sameSite = sameSite
        self.secure = secure
        self.value = value
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.domain = try container.decodeIfPresent(String.self, forKey: .domain)
        self.httpOnly = try container.decodeIfPresent(Bool.self, forKey: .httpOnly)
        self.name = try container.decode(String.self, forKey: .name)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.sameSite = try container.decodeIfPresent(ScreenshotCookieDtoSameSite.self, forKey: .sameSite)
        self.secure = try container.decodeIfPresent(Bool.self, forKey: .secure)
        self.value = try container.decode(String.self, forKey: .value)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.domain, forKey: .domain)
        try container.encodeIfPresent(self.httpOnly, forKey: .httpOnly)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.sameSite, forKey: .sameSite)
        try container.encodeIfPresent(self.secure, forKey: .secure)
        try container.encode(self.value, forKey: .value)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case domain
        case httpOnly
        case name
        case path
        case sameSite
        case secure
        case value
    }
}