import Foundation

public final class JobsClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(type: ListJobsRequestType? = nil, status: ListJobsRequestStatus? = nil, page: Double? = nil, limit: Double? = nil, requestOptions: RequestOptions? = nil) async throws -> ListJobsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/jobs",
            queryParams: [
                "type": type.map { .string($0.rawValue) }, 
                "status": status.map { .string($0.rawValue) }, 
                "page": page.map { .double($0) }, 
                "limit": limit.map { .double($0) }
            ],
            requestOptions: requestOptions,
            responseType: ListJobsResponse.self
        )
    }

    public func get(id: String, page: Double? = nil, limit: Double? = nil, requestOptions: RequestOptions? = nil) async throws -> JobResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/jobs/\(id)",
            queryParams: [
                "page": page.map { .double($0) }, 
                "limit": limit.map { .double($0) }
            ],
            requestOptions: requestOptions,
            responseType: JobResponse.self
        )
    }

    public func cancel(id: String, requestOptions: RequestOptions? = nil) async throws -> CancelJobResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/jobs/\(id)",
            requestOptions: requestOptions,
            responseType: CancelJobResponse.self
        )
    }
}