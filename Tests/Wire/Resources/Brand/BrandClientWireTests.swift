import Foundation
import Testing
import Berrycrawl

@Suite("BrandClient Wire Tests") struct BrandClientWireTests {
    @Test func retrieve1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "brand": {
                      "branding": {
                        "colors": {},
                        "colorScheme": "light",
                        "components": {},
                        "images": {},
                        "spacing": {
                          "baseUnit": 1.1
                        },
                        "typography": {
                          "fontFamilies": {},
                          "fontSizes": {},
                          "fontStacks": {
                            "body": [
                              "body"
                            ],
                            "heading": [
                              "heading"
                            ],
                            "paragraph": [
                              "paragraph"
                            ]
                          }
                        }
                      },
                      "colors": [
                        {
                          "hex": "hex"
                        }
                      ],
                      "description": "description",
                      "domain": "domain",
                      "fonts": [
                        {
                          "family": "family"
                        }
                      ],
                      "images": [
                        {
                          "type": "type",
                          "url": "url"
                        }
                      ],
                      "language": "language",
                      "logos": [
                        {
                          "type": "type",
                          "url": "url"
                        }
                      ],
                      "name": "name",
                      "socials": [
                        {
                          "network": "network",
                          "url": "url"
                        }
                      ],
                      "tagline": "tagline"
                    },
                    "meta": {
                      "cached": true,
                      "creditsUsed": 1,
                      "fetchedAt": "2024-01-15T09:30:00Z",
                      "sourceUrl": "sourceUrl"
                    }
                  },
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Berrycrawl(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BrandResponse(
            data: BrandResponseData(
                brand: BrandProfile(
                    branding: Optional(BrandDesignSystem(
                        colors: BrandDesignSystemColors(

                        ),
                        colorScheme: .light,
                        components: BrandDesignSystemComponents(

                        ),
                        images: BrandDesignSystemImages(

                        ),
                        spacing: BrandDesignSystemSpacing(
                            baseUnit: 1.1
                        ),
                        typography: BrandDesignSystemTypography(
                            fontFamilies: BrandDesignSystemTypographyFontFamilies(

                            ),
                            fontSizes: BrandDesignSystemTypographyFontSizes(

                            ),
                            fontStacks: BrandDesignSystemTypographyFontStacks(
                                body: [
                                    "body"
                                ],
                                heading: [
                                    "heading"
                                ],
                                paragraph: [
                                    "paragraph"
                                ]
                            )
                        )
                    )),
                    colors: [
                        BrandProfileColorsItem(
                            hex: "hex"
                        )
                    ],
                    description: Optional("description"),
                    domain: "domain",
                    fonts: [
                        BrandProfileFontsItem(
                            family: "family"
                        )
                    ],
                    images: [
                        BrandAsset(
                            type: "type",
                            url: "url"
                        )
                    ],
                    language: Optional(Nullable<String>.value("language")),
                    logos: [
                        BrandAsset(
                            type: "type",
                            url: "url"
                        )
                    ],
                    name: "name",
                    socials: [
                        BrandProfileSocialsItem(
                            network: "network",
                            url: "url"
                        )
                    ],
                    tagline: Optional("tagline")
                ),
                meta: BrandResponseDataMeta(
                    cached: true,
                    creditsUsed: 1,
                    fetchedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sourceUrl: "sourceUrl"
                )
            ),
            success: true
        )
        let response = try await client.brand.retrieve(
            request: .init(url: "https://stripe.com"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func retrieve2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "brand": {
                      "branding": {
                        "colors": {
                          "accent": "accent",
                          "background": "background",
                          "link": "link",
                          "primary": "primary",
                          "secondary": "secondary",
                          "textPrimary": "textPrimary"
                        },
                        "colorScheme": "light",
                        "components": {
                          "buttonPrimary": {
                            "background": "background",
                            "borderColor": "borderColor",
                            "borderRadius": "borderRadius",
                            "shadow": "shadow",
                            "textColor": "textColor"
                          },
                          "buttonSecondary": {
                            "background": "background",
                            "borderColor": "borderColor",
                            "borderRadius": "borderRadius",
                            "shadow": "shadow",
                            "textColor": "textColor"
                          },
                          "input": {
                            "background": "background",
                            "borderColor": "borderColor",
                            "borderRadius": "borderRadius",
                            "shadow": "shadow",
                            "textColor": "textColor"
                          }
                        },
                        "images": {
                          "favicon": "favicon",
                          "logo": "logo",
                          "ogImage": "ogImage"
                        },
                        "spacing": {
                          "baseUnit": 1.1,
                          "borderRadius": "borderRadius"
                        },
                        "typography": {
                          "fontFamilies": {
                            "heading": "heading",
                            "primary": "primary"
                          },
                          "fontSizes": {
                            "body": "body",
                            "h1": "h1",
                            "h2": "h2"
                          },
                          "fontStacks": {
                            "body": [
                              "body",
                              "body"
                            ],
                            "heading": [
                              "heading",
                              "heading"
                            ],
                            "paragraph": [
                              "paragraph",
                              "paragraph"
                            ]
                          }
                        }
                      },
                      "colors": [
                        {
                          "hex": "hex",
                          "name": "name"
                        },
                        {
                          "hex": "hex",
                          "name": "name"
                        }
                      ],
                      "description": "description",
                      "domain": "domain",
                      "fonts": [
                        {
                          "family": "family",
                          "weights": [
                            "weights",
                            "weights"
                          ]
                        },
                        {
                          "family": "family",
                          "weights": [
                            "weights",
                            "weights"
                          ]
                        }
                      ],
                      "images": [
                        {
                          "height": 1,
                          "theme": "theme",
                          "type": "type",
                          "url": "url",
                          "width": 1
                        },
                        {
                          "height": 1,
                          "theme": "theme",
                          "type": "type",
                          "url": "url",
                          "width": 1
                        }
                      ],
                      "language": "language",
                      "logos": [
                        {
                          "height": 1,
                          "theme": "theme",
                          "type": "type",
                          "url": "url",
                          "width": 1
                        },
                        {
                          "height": 1,
                          "theme": "theme",
                          "type": "type",
                          "url": "url",
                          "width": 1
                        }
                      ],
                      "name": "name",
                      "socials": [
                        {
                          "network": "network",
                          "url": "url"
                        },
                        {
                          "network": "network",
                          "url": "url"
                        }
                      ],
                      "tagline": "tagline"
                    },
                    "meta": {
                      "cached": true,
                      "creditsUsed": 1,
                      "fetchedAt": "2024-01-15T09:30:00Z",
                      "sourceUrl": "sourceUrl"
                    }
                  },
                  "success": true
                }
                """#.utf8
            )
        )
        let client = Berrycrawl(
            baseURL: "https://api.fern.com",
            apiKey: "<token>",
            urlSession: stub.urlSession
        )
        let expectedResponse = BrandResponse(
            data: BrandResponseData(
                brand: BrandProfile(
                    branding: Optional(BrandDesignSystem(
                        colors: BrandDesignSystemColors(
                            accent: Optional("accent"),
                            background: Optional("background"),
                            link: Optional("link"),
                            primary: Optional("primary"),
                            secondary: Optional("secondary"),
                            textPrimary: Optional("textPrimary")
                        ),
                        colorScheme: .light,
                        components: BrandDesignSystemComponents(
                            buttonPrimary: Optional(BrandComponentStyle(
                                background: Optional("background"),
                                borderColor: Optional("borderColor"),
                                borderRadius: Optional("borderRadius"),
                                shadow: Optional("shadow"),
                                textColor: Optional("textColor")
                            )),
                            buttonSecondary: Optional(BrandComponentStyle(
                                background: Optional("background"),
                                borderColor: Optional("borderColor"),
                                borderRadius: Optional("borderRadius"),
                                shadow: Optional("shadow"),
                                textColor: Optional("textColor")
                            )),
                            input: Optional(BrandComponentStyle(
                                background: Optional("background"),
                                borderColor: Optional("borderColor"),
                                borderRadius: Optional("borderRadius"),
                                shadow: Optional("shadow"),
                                textColor: Optional("textColor")
                            ))
                        ),
                        images: BrandDesignSystemImages(
                            favicon: Optional("favicon"),
                            logo: Optional("logo"),
                            ogImage: Optional("ogImage")
                        ),
                        spacing: BrandDesignSystemSpacing(
                            baseUnit: 1.1,
                            borderRadius: Optional("borderRadius")
                        ),
                        typography: BrandDesignSystemTypography(
                            fontFamilies: BrandDesignSystemTypographyFontFamilies(
                                heading: Optional("heading"),
                                primary: Optional("primary")
                            ),
                            fontSizes: BrandDesignSystemTypographyFontSizes(
                                body: Optional("body"),
                                h1: Optional("h1"),
                                h2: Optional("h2")
                            ),
                            fontStacks: BrandDesignSystemTypographyFontStacks(
                                body: [
                                    "body",
                                    "body"
                                ],
                                heading: [
                                    "heading",
                                    "heading"
                                ],
                                paragraph: [
                                    "paragraph",
                                    "paragraph"
                                ]
                            )
                        )
                    )),
                    colors: [
                        BrandProfileColorsItem(
                            hex: "hex",
                            name: Optional("name")
                        ),
                        BrandProfileColorsItem(
                            hex: "hex",
                            name: Optional("name")
                        )
                    ],
                    description: Optional("description"),
                    domain: "domain",
                    fonts: [
                        BrandProfileFontsItem(
                            family: "family",
                            weights: Optional([
                                "weights",
                                "weights"
                            ])
                        ),
                        BrandProfileFontsItem(
                            family: "family",
                            weights: Optional([
                                "weights",
                                "weights"
                            ])
                        )
                    ],
                    images: [
                        BrandAsset(
                            height: Optional(1),
                            theme: Optional("theme"),
                            type: "type",
                            url: "url",
                            width: Optional(1)
                        ),
                        BrandAsset(
                            height: Optional(1),
                            theme: Optional("theme"),
                            type: "type",
                            url: "url",
                            width: Optional(1)
                        )
                    ],
                    language: Optional(Nullable<String>.value("language")),
                    logos: [
                        BrandAsset(
                            height: Optional(1),
                            theme: Optional("theme"),
                            type: "type",
                            url: "url",
                            width: Optional(1)
                        ),
                        BrandAsset(
                            height: Optional(1),
                            theme: Optional("theme"),
                            type: "type",
                            url: "url",
                            width: Optional(1)
                        )
                    ],
                    name: "name",
                    socials: [
                        BrandProfileSocialsItem(
                            network: "network",
                            url: "url"
                        ),
                        BrandProfileSocialsItem(
                            network: "network",
                            url: "url"
                        )
                    ],
                    tagline: Optional("tagline")
                ),
                meta: BrandResponseDataMeta(
                    cached: true,
                    creditsUsed: 1,
                    fetchedAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                    sourceUrl: "sourceUrl"
                )
            ),
            success: true
        )
        let response = try await client.brand.retrieve(
            request: .init(url: "url"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}