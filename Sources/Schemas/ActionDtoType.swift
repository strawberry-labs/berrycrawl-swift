import Foundation

public enum ActionDtoType: String, Codable, Hashable, CaseIterable, Sendable {
    case wait
    case click
    case write
    case press
    case scroll
    case scrape
    case screenshot
    case pdf
}