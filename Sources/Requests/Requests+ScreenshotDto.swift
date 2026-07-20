import Foundation

extension Requests {
    public struct ScreenshotDto: Codable, Hashable, Sendable {
        /// Block common advertising and analytics requests
        public let blockAds: Bool?
        /// Click this CSS selector before capture
        public let clickSelector: String?
        /// Capture an exact pixel rectangle instead of the page
        public let clip: ScreenshotClipDto?
        public let colorScheme: ScreenshotDtoColorScheme?
        /// Cookies to set before loading the page
        public let cookies: [ScreenshotCookieDto]?
        /// Extra settling time after the page is ready, in milliseconds
        public let delay: Double?
        /// Named viewport preset
        public let device: ScreenshotDtoDevice?
        public let disableAnimations: Bool?
        public let format: ScreenshotDtoFormat?
        /// Capture the complete page instead of only the viewport
        public let fullPage: Bool?
        /// auto uses native capture for normal pages and stitched slices for very tall pages
        public let fullPageAlgorithm: ScreenshotDtoFullPageAlgorithm?
        /// Headers sent while loading the page
        public let headers: [String: JSONValue]?
        /// Show fixed/sticky UI once instead of repeating it in stitched captures
        public let hideFixedElements: Bool?
        /// Hide matching elements before capture
        public let hideSelectors: [String]?
        public let location: ScreenshotLocationDto?
        public let maskColor: String?
        /// Cover matching elements with a solid privacy mask
        public let maskSelectors: [String]?
        /// Maximum full-page height. Prevents endless captures on infinite pages.
        public let maxHeight: Double?
        /// Use a transparent background where the page allows it
        public let omitBackground: Bool?
        /// Proxy mode
        public let proxy: ScreenshotDtoProxy?
        /// JPEG or WebP quality
        public let quality: Double?
        public let reducedMotion: Bool?
        /// Hide common support and chat widgets
        public let removeChatWidgets: Bool?
        /// Accept known consent dialogs, hide remaining cookie banners, and restore page scrolling
        public let removeCookieBanners: Bool?
        /// Remove newsletter gates, modal backdrops, and blocking overlays
        public let removeOverlays: Bool?
        /// Return a CDN URL or an inline data URL
        public let responseFormat: ScreenshotDtoResponseFormat?
        /// Capture at CSS pixel size or the emulated device pixel ratio
        public let scale: ScreenshotDtoScale?
        /// Pause between lazy-load scroll steps, in milliseconds
        public let scrollDelay: Double?
        /// Scroll through the page first so lazy content is loaded
        public let scrollPage: Bool?
        /// Capture one element instead of the page
        public let selector: String?
        /// CSS rules to apply before capture
        public let styles: [String]?
        public let timeout: Double?
        /// Public webpage URL to capture
        public let url: String
        /// Custom viewport. Overrides the named device dimensions.
        public let viewport: ScreenshotViewportDto?
        /// Wait for this CSS selector before capture
        public let waitForSelector: String?
        /// Page readiness milestone used before capture
        public let waitUntil: ScreenshotDtoWaitUntil?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            blockAds: Bool? = nil,
            clickSelector: String? = nil,
            clip: ScreenshotClipDto? = nil,
            colorScheme: ScreenshotDtoColorScheme? = nil,
            cookies: [ScreenshotCookieDto]? = nil,
            delay: Double? = nil,
            device: ScreenshotDtoDevice? = nil,
            disableAnimations: Bool? = nil,
            format: ScreenshotDtoFormat? = nil,
            fullPage: Bool? = nil,
            fullPageAlgorithm: ScreenshotDtoFullPageAlgorithm? = nil,
            headers: [String: JSONValue]? = nil,
            hideFixedElements: Bool? = nil,
            hideSelectors: [String]? = nil,
            location: ScreenshotLocationDto? = nil,
            maskColor: String? = nil,
            maskSelectors: [String]? = nil,
            maxHeight: Double? = nil,
            omitBackground: Bool? = nil,
            proxy: ScreenshotDtoProxy? = nil,
            quality: Double? = nil,
            reducedMotion: Bool? = nil,
            removeChatWidgets: Bool? = nil,
            removeCookieBanners: Bool? = nil,
            removeOverlays: Bool? = nil,
            responseFormat: ScreenshotDtoResponseFormat? = nil,
            scale: ScreenshotDtoScale? = nil,
            scrollDelay: Double? = nil,
            scrollPage: Bool? = nil,
            selector: String? = nil,
            styles: [String]? = nil,
            timeout: Double? = nil,
            url: String,
            viewport: ScreenshotViewportDto? = nil,
            waitForSelector: String? = nil,
            waitUntil: ScreenshotDtoWaitUntil? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.blockAds = blockAds
            self.clickSelector = clickSelector
            self.clip = clip
            self.colorScheme = colorScheme
            self.cookies = cookies
            self.delay = delay
            self.device = device
            self.disableAnimations = disableAnimations
            self.format = format
            self.fullPage = fullPage
            self.fullPageAlgorithm = fullPageAlgorithm
            self.headers = headers
            self.hideFixedElements = hideFixedElements
            self.hideSelectors = hideSelectors
            self.location = location
            self.maskColor = maskColor
            self.maskSelectors = maskSelectors
            self.maxHeight = maxHeight
            self.omitBackground = omitBackground
            self.proxy = proxy
            self.quality = quality
            self.reducedMotion = reducedMotion
            self.removeChatWidgets = removeChatWidgets
            self.removeCookieBanners = removeCookieBanners
            self.removeOverlays = removeOverlays
            self.responseFormat = responseFormat
            self.scale = scale
            self.scrollDelay = scrollDelay
            self.scrollPage = scrollPage
            self.selector = selector
            self.styles = styles
            self.timeout = timeout
            self.url = url
            self.viewport = viewport
            self.waitForSelector = waitForSelector
            self.waitUntil = waitUntil
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.blockAds = try container.decodeIfPresent(Bool.self, forKey: .blockAds)
            self.clickSelector = try container.decodeIfPresent(String.self, forKey: .clickSelector)
            self.clip = try container.decodeIfPresent(ScreenshotClipDto.self, forKey: .clip)
            self.colorScheme = try container.decodeIfPresent(ScreenshotDtoColorScheme.self, forKey: .colorScheme)
            self.cookies = try container.decodeIfPresent([ScreenshotCookieDto].self, forKey: .cookies)
            self.delay = try container.decodeIfPresent(Double.self, forKey: .delay)
            self.device = try container.decodeIfPresent(ScreenshotDtoDevice.self, forKey: .device)
            self.disableAnimations = try container.decodeIfPresent(Bool.self, forKey: .disableAnimations)
            self.format = try container.decodeIfPresent(ScreenshotDtoFormat.self, forKey: .format)
            self.fullPage = try container.decodeIfPresent(Bool.self, forKey: .fullPage)
            self.fullPageAlgorithm = try container.decodeIfPresent(ScreenshotDtoFullPageAlgorithm.self, forKey: .fullPageAlgorithm)
            self.headers = try container.decodeIfPresent([String: JSONValue].self, forKey: .headers)
            self.hideFixedElements = try container.decodeIfPresent(Bool.self, forKey: .hideFixedElements)
            self.hideSelectors = try container.decodeIfPresent([String].self, forKey: .hideSelectors)
            self.location = try container.decodeIfPresent(ScreenshotLocationDto.self, forKey: .location)
            self.maskColor = try container.decodeIfPresent(String.self, forKey: .maskColor)
            self.maskSelectors = try container.decodeIfPresent([String].self, forKey: .maskSelectors)
            self.maxHeight = try container.decodeIfPresent(Double.self, forKey: .maxHeight)
            self.omitBackground = try container.decodeIfPresent(Bool.self, forKey: .omitBackground)
            self.proxy = try container.decodeIfPresent(ScreenshotDtoProxy.self, forKey: .proxy)
            self.quality = try container.decodeIfPresent(Double.self, forKey: .quality)
            self.reducedMotion = try container.decodeIfPresent(Bool.self, forKey: .reducedMotion)
            self.removeChatWidgets = try container.decodeIfPresent(Bool.self, forKey: .removeChatWidgets)
            self.removeCookieBanners = try container.decodeIfPresent(Bool.self, forKey: .removeCookieBanners)
            self.removeOverlays = try container.decodeIfPresent(Bool.self, forKey: .removeOverlays)
            self.responseFormat = try container.decodeIfPresent(ScreenshotDtoResponseFormat.self, forKey: .responseFormat)
            self.scale = try container.decodeIfPresent(ScreenshotDtoScale.self, forKey: .scale)
            self.scrollDelay = try container.decodeIfPresent(Double.self, forKey: .scrollDelay)
            self.scrollPage = try container.decodeIfPresent(Bool.self, forKey: .scrollPage)
            self.selector = try container.decodeIfPresent(String.self, forKey: .selector)
            self.styles = try container.decodeIfPresent([String].self, forKey: .styles)
            self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
            self.url = try container.decode(String.self, forKey: .url)
            self.viewport = try container.decodeIfPresent(ScreenshotViewportDto.self, forKey: .viewport)
            self.waitForSelector = try container.decodeIfPresent(String.self, forKey: .waitForSelector)
            self.waitUntil = try container.decodeIfPresent(ScreenshotDtoWaitUntil.self, forKey: .waitUntil)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encodeIfPresent(self.blockAds, forKey: .blockAds)
            try container.encodeIfPresent(self.clickSelector, forKey: .clickSelector)
            try container.encodeIfPresent(self.clip, forKey: .clip)
            try container.encodeIfPresent(self.colorScheme, forKey: .colorScheme)
            try container.encodeIfPresent(self.cookies, forKey: .cookies)
            try container.encodeIfPresent(self.delay, forKey: .delay)
            try container.encodeIfPresent(self.device, forKey: .device)
            try container.encodeIfPresent(self.disableAnimations, forKey: .disableAnimations)
            try container.encodeIfPresent(self.format, forKey: .format)
            try container.encodeIfPresent(self.fullPage, forKey: .fullPage)
            try container.encodeIfPresent(self.fullPageAlgorithm, forKey: .fullPageAlgorithm)
            try container.encodeIfPresent(self.headers, forKey: .headers)
            try container.encodeIfPresent(self.hideFixedElements, forKey: .hideFixedElements)
            try container.encodeIfPresent(self.hideSelectors, forKey: .hideSelectors)
            try container.encodeIfPresent(self.location, forKey: .location)
            try container.encodeIfPresent(self.maskColor, forKey: .maskColor)
            try container.encodeIfPresent(self.maskSelectors, forKey: .maskSelectors)
            try container.encodeIfPresent(self.maxHeight, forKey: .maxHeight)
            try container.encodeIfPresent(self.omitBackground, forKey: .omitBackground)
            try container.encodeIfPresent(self.proxy, forKey: .proxy)
            try container.encodeIfPresent(self.quality, forKey: .quality)
            try container.encodeIfPresent(self.reducedMotion, forKey: .reducedMotion)
            try container.encodeIfPresent(self.removeChatWidgets, forKey: .removeChatWidgets)
            try container.encodeIfPresent(self.removeCookieBanners, forKey: .removeCookieBanners)
            try container.encodeIfPresent(self.removeOverlays, forKey: .removeOverlays)
            try container.encodeIfPresent(self.responseFormat, forKey: .responseFormat)
            try container.encodeIfPresent(self.scale, forKey: .scale)
            try container.encodeIfPresent(self.scrollDelay, forKey: .scrollDelay)
            try container.encodeIfPresent(self.scrollPage, forKey: .scrollPage)
            try container.encodeIfPresent(self.selector, forKey: .selector)
            try container.encodeIfPresent(self.styles, forKey: .styles)
            try container.encodeIfPresent(self.timeout, forKey: .timeout)
            try container.encode(self.url, forKey: .url)
            try container.encodeIfPresent(self.viewport, forKey: .viewport)
            try container.encodeIfPresent(self.waitForSelector, forKey: .waitForSelector)
            try container.encodeIfPresent(self.waitUntil, forKey: .waitUntil)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case blockAds
            case clickSelector
            case clip
            case colorScheme
            case cookies
            case delay
            case device
            case disableAnimations
            case format
            case fullPage
            case fullPageAlgorithm
            case headers
            case hideFixedElements
            case hideSelectors
            case location
            case maskColor
            case maskSelectors
            case maxHeight
            case omitBackground
            case proxy
            case quality
            case reducedMotion
            case removeChatWidgets
            case removeCookieBanners
            case removeOverlays
            case responseFormat
            case scale
            case scrollDelay
            case scrollPage
            case selector
            case styles
            case timeout
            case url
            case viewport
            case waitForSelector
            case waitUntil
        }
    }
}