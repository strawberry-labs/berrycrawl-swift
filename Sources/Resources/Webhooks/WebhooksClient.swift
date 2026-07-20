import Foundation

public final class WebhooksClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func list(requestOptions: RequestOptions? = nil) async throws -> ListWebhooksResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/webhooks",
            requestOptions: requestOptions,
            responseType: ListWebhooksResponse.self
        )
    }

    public func create(request: Requests.CreateWebhookDto, requestOptions: RequestOptions? = nil) async throws -> WebhookResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/webhooks",
            body: request,
            requestOptions: requestOptions,
            responseType: WebhookResponse.self
        )
    }

    public func get(id: String, requestOptions: RequestOptions? = nil) async throws -> WebhookResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/webhooks/\(id)",
            requestOptions: requestOptions,
            responseType: WebhookResponse.self
        )
    }

    public func delete(id: String, requestOptions: RequestOptions? = nil) async throws -> MessageResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/webhooks/\(id)",
            requestOptions: requestOptions,
            responseType: MessageResponse.self
        )
    }

    public func update(id: String, request: Requests.UpdateWebhookDto, requestOptions: RequestOptions? = nil) async throws -> WebhookResponse {
        return try await httpClient.performRequest(
            method: .patch,
            path: "/webhooks/\(id)",
            body: request,
            requestOptions: requestOptions,
            responseType: WebhookResponse.self
        )
    }

    public func test(id: String, request: Requests.TestWebhookDto, requestOptions: RequestOptions? = nil) async throws -> TestWebhookResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/webhooks/\(id)/test",
            body: request,
            requestOptions: requestOptions,
            responseType: TestWebhookResponse.self
        )
    }
}