import Foundation

/// Named viewport preset
public enum ScreenshotDtoDevice: String, Codable, Hashable, CaseIterable, Sendable {
    case desktop
    case desktopHd = "desktop-hd"
    case tablet
    case iphone15 = "iphone-15"
    case pixel8 = "pixel-8"
}