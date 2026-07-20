import Foundation

public struct AccountResponseData: Codable, Hashable, Sendable {
    public let createdAt: Date
    public let credits: Int
    public let email: String
    public let id: String
    public let lifetimeSpendUsd: Double
    public let plan: AccountResponseDataPlan
    public let queue: AccountResponseDataQueue
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        createdAt: Date,
        credits: Int,
        email: String,
        id: String,
        lifetimeSpendUsd: Double,
        plan: AccountResponseDataPlan,
        queue: AccountResponseDataQueue,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.createdAt = createdAt
        self.credits = credits
        self.email = email
        self.id = id
        self.lifetimeSpendUsd = lifetimeSpendUsd
        self.plan = plan
        self.queue = queue
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.credits = try container.decode(Int.self, forKey: .credits)
        self.email = try container.decode(String.self, forKey: .email)
        self.id = try container.decode(String.self, forKey: .id)
        self.lifetimeSpendUsd = try container.decode(Double.self, forKey: .lifetimeSpendUsd)
        self.plan = try container.decode(AccountResponseDataPlan.self, forKey: .plan)
        self.queue = try container.decode(AccountResponseDataQueue.self, forKey: .queue)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.credits, forKey: .credits)
        try container.encode(self.email, forKey: .email)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.lifetimeSpendUsd, forKey: .lifetimeSpendUsd)
        try container.encode(self.plan, forKey: .plan)
        try container.encode(self.queue, forKey: .queue)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case createdAt
        case credits
        case email
        case id
        case lifetimeSpendUsd
        case plan
        case queue
    }
}