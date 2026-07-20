import Foundation
import Testing
import Berrycrawl

@Suite("WebhooksClient Wire Tests") struct WebhooksClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "createdAt": "2024-01-15T09:30:00Z",
                      "events": [
                        "events"
                      ],
                      "id": "id",
                      "isActive": true,
                      "recentDeliveries": [
                        {
                          "key": "value"
                        }
                      ],
                      "secret": "secret",
                      "updatedAt": "2024-01-15T09:30:00Z",
                      "url": "url"
                    }
                  ],
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
        let expectedResponse = ListWebhooksResponse(
            data: [
                Webhook(
                    createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    events: [
                        "events"
                    ],
                    id: "id",
                    isActive: true,
                    recentDeliveries: Optional([
                        [
                            "key": JSONValue.string("value")
                        ]
                    ]),
                    secret: Optional("secret"),
                    updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    url: "url"
                )
            ],
            success: true
        )
        let response = try await client.webhooks.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": [
                    {
                      "createdAt": "2024-01-15T09:30:00Z",
                      "events": [
                        "events",
                        "events"
                      ],
                      "id": "id",
                      "isActive": true,
                      "recentDeliveries": [
                        {
                          "recentDeliveries": {
                            "key": "value"
                          }
                        },
                        {
                          "recentDeliveries": {
                            "key": "value"
                          }
                        }
                      ],
                      "secret": "secret",
                      "updatedAt": "2024-01-15T09:30:00Z",
                      "url": "url"
                    },
                    {
                      "createdAt": "2024-01-15T09:30:00Z",
                      "events": [
                        "events",
                        "events"
                      ],
                      "id": "id",
                      "isActive": true,
                      "recentDeliveries": [
                        {
                          "recentDeliveries": {
                            "key": "value"
                          }
                        },
                        {
                          "recentDeliveries": {
                            "key": "value"
                          }
                        }
                      ],
                      "secret": "secret",
                      "updatedAt": "2024-01-15T09:30:00Z",
                      "url": "url"
                    }
                  ],
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
        let expectedResponse = ListWebhooksResponse(
            data: [
                Webhook(
                    createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    events: [
                        "events",
                        "events"
                    ],
                    id: "id",
                    isActive: true,
                    recentDeliveries: Optional([
                        [
                            "recentDeliveries": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ],
                        [
                            "recentDeliveries": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]
                    ]),
                    secret: Optional("secret"),
                    updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    url: "url"
                ),
                Webhook(
                    createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    events: [
                        "events",
                        "events"
                    ],
                    id: "id",
                    isActive: true,
                    recentDeliveries: Optional([
                        [
                            "recentDeliveries": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ],
                        [
                            "recentDeliveries": JSONValue.object(
                                [
                                    "key": JSONValue.string("value")
                                ]
                            )
                        ]
                    ]),
                    secret: Optional("secret"),
                    updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                    url: "url"
                )
            ],
            success: true
        )
        let response = try await client.webhooks.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func create1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "events": [
                      "events"
                    ],
                    "id": "id",
                    "isActive": true,
                    "recentDeliveries": [
                      {
                        "key": "value"
                      }
                    ],
                    "secret": "secret",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "url": "url"
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
        let expectedResponse = WebhookResponse(
            data: Webhook(
                createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                events: [
                    "events"
                ],
                id: "id",
                isActive: true,
                recentDeliveries: Optional([
                    [
                        "key": JSONValue.string("value")
                    ]
                ]),
                secret: Optional("secret"),
                updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                url: "url"
            ),
            success: true
        )
        let response = try await client.webhooks.create(
            request: .init(
                events: [
                    "crawl.completed",
                    "extract.failed"
                ],
                url: "https://api.example.com/webhooks"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func create2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "events": [
                      "events",
                      "events"
                    ],
                    "id": "id",
                    "isActive": true,
                    "recentDeliveries": [
                      {
                        "recentDeliveries": {
                          "key": "value"
                        }
                      },
                      {
                        "recentDeliveries": {
                          "key": "value"
                        }
                      }
                    ],
                    "secret": "secret",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "url": "url"
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
        let expectedResponse = WebhookResponse(
            data: Webhook(
                createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                events: [
                    "events",
                    "events"
                ],
                id: "id",
                isActive: true,
                recentDeliveries: Optional([
                    [
                        "recentDeliveries": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    [
                        "recentDeliveries": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]
                ]),
                secret: Optional("secret"),
                updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                url: "url"
            ),
            success: true
        )
        let response = try await client.webhooks.create(
            request: .init(
                events: [
                    "events",
                    "events"
                ],
                url: "url"
            ),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "events": [
                      "events"
                    ],
                    "id": "id",
                    "isActive": true,
                    "recentDeliveries": [
                      {
                        "key": "value"
                      }
                    ],
                    "secret": "secret",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "url": "url"
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
        let expectedResponse = WebhookResponse(
            data: Webhook(
                createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                events: [
                    "events"
                ],
                id: "id",
                isActive: true,
                recentDeliveries: Optional([
                    [
                        "key": JSONValue.string("value")
                    ]
                ]),
                secret: Optional("secret"),
                updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                url: "url"
            ),
            success: true
        )
        let response = try await client.webhooks.get(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func get2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "events": [
                      "events",
                      "events"
                    ],
                    "id": "id",
                    "isActive": true,
                    "recentDeliveries": [
                      {
                        "recentDeliveries": {
                          "key": "value"
                        }
                      },
                      {
                        "recentDeliveries": {
                          "key": "value"
                        }
                      }
                    ],
                    "secret": "secret",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "url": "url"
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
        let expectedResponse = WebhookResponse(
            data: Webhook(
                createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                events: [
                    "events",
                    "events"
                ],
                id: "id",
                isActive: true,
                recentDeliveries: Optional([
                    [
                        "recentDeliveries": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    [
                        "recentDeliveries": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]
                ]),
                secret: Optional("secret"),
                updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                url: "url"
            ),
            success: true
        )
        let response = try await client.webhooks.get(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": "message",
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
        let expectedResponse = MessageResponse(
            message: "message",
            success: true
        )
        let response = try await client.webhooks.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func delete2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "message": "message",
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
        let expectedResponse = MessageResponse(
            message: "message",
            success: true
        )
        let response = try await client.webhooks.delete(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "events": [
                      "events"
                    ],
                    "id": "id",
                    "isActive": true,
                    "recentDeliveries": [
                      {
                        "key": "value"
                      }
                    ],
                    "secret": "secret",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "url": "url"
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
        let expectedResponse = WebhookResponse(
            data: Webhook(
                createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                events: [
                    "events"
                ],
                id: "id",
                isActive: true,
                recentDeliveries: Optional([
                    [
                        "key": JSONValue.string("value")
                    ]
                ]),
                secret: Optional("secret"),
                updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                url: "url"
            ),
            success: true
        )
        let response = try await client.webhooks.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func update2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "events": [
                      "events",
                      "events"
                    ],
                    "id": "id",
                    "isActive": true,
                    "recentDeliveries": [
                      {
                        "recentDeliveries": {
                          "key": "value"
                        }
                      },
                      {
                        "recentDeliveries": {
                          "key": "value"
                        }
                      }
                    ],
                    "secret": "secret",
                    "updatedAt": "2024-01-15T09:30:00Z",
                    "url": "url"
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
        let expectedResponse = WebhookResponse(
            data: Webhook(
                createdAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                events: [
                    "events",
                    "events"
                ],
                id: "id",
                isActive: true,
                recentDeliveries: Optional([
                    [
                        "recentDeliveries": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    [
                        "recentDeliveries": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]
                ]),
                secret: Optional("secret"),
                updatedAt: Optional(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601)),
                url: "url"
            ),
            success: true
        )
        let response = try await client.webhooks.update(
            id: "id",
            request: .init(),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func test1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "event": "event",
                  "message": "message",
                  "payload": {
                    "key": "value"
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
        let expectedResponse = TestWebhookResponse(
            event: "event",
            message: "message",
            payload: [
                "key": JSONValue.string("value")
            ],
            success: true
        )
        let response = try await client.webhooks.test(
            id: "id",
            request: .init(event: "crawl.completed"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func test2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "event": "event",
                  "message": "message",
                  "payload": {
                    "payload": {
                      "key": "value"
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
        let expectedResponse = TestWebhookResponse(
            event: "event",
            message: "message",
            payload: [
                "payload": JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )
            ],
            success: true
        )
        let response = try await client.webhooks.test(
            id: "id",
            request: .init(event: "event"),
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}