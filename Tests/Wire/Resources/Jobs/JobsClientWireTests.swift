import Foundation
import Testing
import Berrycrawl

@Suite("JobsClient Wire Tests") struct JobsClientWireTests {
    @Test func list1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "jobs": [
                      {
                        "createdAt": "2024-01-15T09:30:00Z",
                        "creditsUsed": 1,
                        "id": "id",
                        "status": "status",
                        "total": 1,
                        "type": "crawl"
                      }
                    ],
                    "pagination": {
                      "limit": 1,
                      "page": 1,
                      "total": 1,
                      "totalPages": 1
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
        let expectedResponse = ListJobsResponse(
            data: ListJobsResponseData(
                jobs: [
                    JobSummary(
                        createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        creditsUsed: 1,
                        id: "id",
                        status: "status",
                        total: 1,
                        type: .crawl
                    )
                ],
                pagination: Pagination(
                    limit: 1,
                    page: 1,
                    total: 1,
                    totalPages: Optional(1)
                )
            ),
            success: true
        )
        let response = try await client.jobs.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func list2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "jobs": [
                      {
                        "completed": 1,
                        "completedAt": "2024-01-15T09:30:00Z",
                        "createdAt": "2024-01-15T09:30:00Z",
                        "creditsUsed": 1,
                        "error": "error",
                        "failed": 1,
                        "id": "id",
                        "startedAt": "2024-01-15T09:30:00Z",
                        "status": "status",
                        "total": 1,
                        "type": "crawl"
                      },
                      {
                        "completed": 1,
                        "completedAt": "2024-01-15T09:30:00Z",
                        "createdAt": "2024-01-15T09:30:00Z",
                        "creditsUsed": 1,
                        "error": "error",
                        "failed": 1,
                        "id": "id",
                        "startedAt": "2024-01-15T09:30:00Z",
                        "status": "status",
                        "total": 1,
                        "type": "crawl"
                      }
                    ],
                    "pagination": {
                      "limit": 1,
                      "page": 1,
                      "total": 1,
                      "totalPages": 1
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
        let expectedResponse = ListJobsResponse(
            data: ListJobsResponseData(
                jobs: [
                    JobSummary(
                        completed: Optional(Nullable<Int>.value(1)),
                        completedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        creditsUsed: 1,
                        error: Optional(Nullable<String>.value("error")),
                        failed: Optional(Nullable<Int>.value(1)),
                        id: "id",
                        startedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        status: "status",
                        total: 1,
                        type: .crawl
                    ),
                    JobSummary(
                        completed: Optional(Nullable<Int>.value(1)),
                        completedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                        creditsUsed: 1,
                        error: Optional(Nullable<String>.value("error")),
                        failed: Optional(Nullable<Int>.value(1)),
                        id: "id",
                        startedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                        status: "status",
                        total: 1,
                        type: .crawl
                    )
                ],
                pagination: Pagination(
                    limit: 1,
                    page: 1,
                    total: 1,
                    totalPages: Optional(1)
                )
            ),
            success: true
        )
        let response = try await client.jobs.list(requestOptions: RequestOptions(additionalHeaders: stub.headers))
        try #require(response == expectedResponse)
    }

    @Test func get1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "completed": 1,
                    "completedAt": "2024-01-15T09:30:00Z",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "creditsUsed": 1,
                    "error": "error",
                    "failed": 1,
                    "id": "id",
                    "startedAt": "2024-01-15T09:30:00Z",
                    "status": "status",
                    "total": 1,
                    "type": "crawl",
                    "errors": [
                      {}
                    ],
                    "result": {
                      "key": "value"
                    },
                    "resultPagination": {
                      "limit": 1,
                      "page": 1,
                      "total": 1,
                      "totalPages": 1
                    },
                    "results": [
                      {
                        "key": "value"
                      }
                    ]
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
        let expectedResponse = JobResponse(
            data: JobResponseData(
                completed: Optional(Nullable<Int>.value(1)),
                completedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                creditsUsed: 1,
                error: Optional(Nullable<String>.value("error")),
                failed: Optional(Nullable<Int>.value(1)),
                id: "id",
                startedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                status: "status",
                total: 1,
                type: .crawl,
                errors: [
                    JobResponseDataErrorsItem(

                    )
                ],
                result: Optional(JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )),
                resultPagination: Pagination(
                    limit: 1,
                    page: 1,
                    total: 1,
                    totalPages: Optional(1)
                ),
                results: [
                    [
                        "key": JSONValue.string("value")
                    ]
                ]
            ),
            success: true
        )
        let response = try await client.jobs.get(
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
                    "errors": [
                      {
                        "error": "error",
                        "url": "url"
                      },
                      {
                        "error": "error",
                        "url": "url"
                      }
                    ],
                    "result": {
                      "key": "value"
                    },
                    "resultPagination": {
                      "limit": 1,
                      "page": 1,
                      "total": 1,
                      "totalPages": 1
                    },
                    "results": [
                      {
                        "results": {
                          "key": "value"
                        }
                      },
                      {
                        "results": {
                          "key": "value"
                        }
                      }
                    ],
                    "completed": 1,
                    "completedAt": "2024-01-15T09:30:00Z",
                    "createdAt": "2024-01-15T09:30:00Z",
                    "creditsUsed": 1,
                    "error": "error",
                    "failed": 1,
                    "id": "id",
                    "startedAt": "2024-01-15T09:30:00Z",
                    "status": "status",
                    "total": 1,
                    "type": "crawl"
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
        let expectedResponse = JobResponse(
            data: JobResponseData(
                completed: Optional(Nullable<Int>.value(1)),
                completedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                createdAt: try! Date("2024-01-15T09:30:00Z", strategy: .iso8601),
                creditsUsed: 1,
                error: Optional(Nullable<String>.value("error")),
                failed: Optional(Nullable<Int>.value(1)),
                id: "id",
                startedAt: Optional(Nullable<Date>.value(try! Date("2024-01-15T09:30:00Z", strategy: .iso8601))),
                status: "status",
                total: 1,
                type: .crawl,
                errors: [
                    JobResponseDataErrorsItem(
                        error: Optional("error"),
                        url: Optional("url")
                    ),
                    JobResponseDataErrorsItem(
                        error: Optional("error"),
                        url: Optional("url")
                    )
                ],
                result: Optional(JSONValue.object(
                    [
                        "key": JSONValue.string("value")
                    ]
                )),
                resultPagination: Pagination(
                    limit: 1,
                    page: 1,
                    total: 1,
                    totalPages: Optional(1)
                ),
                results: [
                    [
                        "results": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ],
                    [
                        "results": JSONValue.object(
                            [
                                "key": JSONValue.string("value")
                            ]
                        )
                    ]
                ]
            ),
            success: true
        )
        let response = try await client.jobs.get(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel1() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "status": "status"
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
        let expectedResponse = CancelJobResponse(
            data: CancelJobResponseData(
                id: "id",
                status: "status"
            ),
            success: true
        )
        let response = try await client.jobs.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }

    @Test func cancel2() async throws -> Void {
        let stub = HTTPStub()
        stub.setResponse(
            body: Foundation.Data(
                #"""
                {
                  "data": {
                    "id": "id",
                    "status": "status"
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
        let expectedResponse = CancelJobResponse(
            data: CancelJobResponseData(
                id: "id",
                status: "status"
            ),
            success: true
        )
        let response = try await client.jobs.cancel(
            id: "id",
            requestOptions: RequestOptions(additionalHeaders: stub.headers)
        )
        try #require(response == expectedResponse)
    }
}