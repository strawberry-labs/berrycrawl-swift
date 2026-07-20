import Foundation

public final class BrandClient: Sendable {
    private let httpClient: HTTPClient

    init(config: ClientConfig) {
        self.httpClient = HTTPClient(config: config)
    }

    /// Send one website URL. BerryCrawl returns the brand identity found on that site.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func retrieve(request: Requests.BrandDto, requestOptions: RequestOptions? = nil) async throws -> BrandResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/brand",
            body: request,
            requestOptions: requestOptions,
            responseType: BrandResponse.self
        )
    }
}