import Foundation

public enum ScrapeDtoFormatsItem: Codable, Hashable, Sendable {
    case scrapeDtoFormatsItemZero(ScrapeDtoFormatsItemZero)
    case jsonFormatDto(JsonFormatDto)
    case summaryFormatDto(SummaryFormatDto)
    case changeTrackingFormatDto(ChangeTrackingFormatDto)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(ScrapeDtoFormatsItemZero.self) {
            self = .scrapeDtoFormatsItemZero(value)
        } else if let value = try? container.decode(JsonFormatDto.self) {
            self = .jsonFormatDto(value)
        } else if let value = try? container.decode(SummaryFormatDto.self) {
            self = .summaryFormatDto(value)
        } else if let value = try? container.decode(ChangeTrackingFormatDto.self) {
            self = .changeTrackingFormatDto(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .scrapeDtoFormatsItemZero(let value):
            try container.encode(value)
        case .jsonFormatDto(let value):
            try container.encode(value)
        case .summaryFormatDto(let value):
            try container.encode(value)
        case .changeTrackingFormatDto(let value):
            try container.encode(value)
        }
    }
}