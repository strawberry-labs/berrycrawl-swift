import Foundation
import Testing
import Berrycrawl

@Suite("AccountClient Wire Tests") struct AccountClientWireTests {
    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "createdAt": "2024-01-15T09:30:00Z",
                    "credits": 1,
                    "email": "email",
                    "id": "id",
                    "lifetimeSpendUsd": 1.1,
                    "plan": {
                      "concurrency": 1,
                      "id": "id",
                      "name": "name",
                      "queueLimit": 1,
                      "rateLimitPerMinute": 1
                    },
                    "queue": {
                      "active": 1,
                      "waiting": 1
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
        let expectedResponse = AccountResponse(
            data: AccountResponseData(
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                credits: 1,
                email: "email",
                id: "id",
                lifetimeSpendUsd: 1.1,
                plan: AccountResponseDataPlan(
                    concurrency: 1,
                    id: "id",
                    name: "name",
                    queueLimit: 1,
                    rateLimitPerMinute: 1
                ),
                queue: AccountResponseDataQueue(
                    active: 1,
                    waiting: 1
                )
            ),
            success: true
        )
        let response = try await client.account.get(requestOptions: RequestOptions(additionalHeaders: stub.headers))
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
                    "credits": 1,
                    "email": "email",
                    "id": "id",
                    "lifetimeSpendUsd": 1.1,
                    "plan": {
                      "concurrency": 1,
                      "id": "id",
                      "name": "name",
                      "queueLimit": 1,
                      "rateLimitPerMinute": 1
                    },
                    "queue": {
                      "active": 1,
                      "waiting": 1
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
        let expectedResponse = AccountResponse(
            data: AccountResponseData(
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                credits: 1,
                email: "email",
                id: "id",
                lifetimeSpendUsd: 1.1,
                plan: AccountResponseDataPlan(
                    concurrency: 1,
                    id: "id",
                    name: "name",
                    queueLimit: 1,
                    rateLimitPerMinute: 1
                ),
                queue: AccountResponseDataQueue(
                    active: 1,
                    waiting: 1
                )
            ),
            success: true
        )
        let response = try await client.account.get(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }
}