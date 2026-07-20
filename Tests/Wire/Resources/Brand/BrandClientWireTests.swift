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
                    language: Optional("language"),
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
                    language: Optional("language"),
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