import Foundation

public final class AccountClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    public func get(requestOptions: RequestOptions? = nil) async throws -> AccountResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/account",
            requestOptions: requestOptions,
            responseType: AccountResponse.self
        )
    }
}