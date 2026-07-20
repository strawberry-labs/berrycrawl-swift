import Foundation

/// Use this class to access the different functions within the SDK. You can instantiate any number of clients with different configuration that will propagate to these functions.
public final class Berrycrawl: Sendable {
    public let account: AccountClient
    public let brand: BrandClient
    public let jobs: JobsClient
    public let webhooks: WebhooksClient
    private let httpClient: HTTPClient

    /// Initialize the client with the specified configuration and a static bearer token.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter apiKey: Bearer token for authentication. If provided, will be sent as "Bearer {token}" in Authorization header.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = BerrycrawlEnvironment.production.rawValue,
        apiKey: String,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        self.init(
            baseURL: baseURL,
            headerAuth: nil,
            bearerAuth: .init(token: .staticToken(apiKey)),
            basicAuth: nil,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    /// Initialize the client with the specified configuration and an async bearer token provider.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter apiKey: An async function that returns the bearer token for authentication. If provided, will be sent as "Bearer {token}" in Authorization header.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = BerrycrawlEnvironment.production.rawValue,
        apiKey: @escaping ClientConfig.CredentialProvider,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        self.init(
            baseURL: baseURL,
            headerAuth: nil,
            bearerAuth: .init(token: .provider(apiKey)),
            basicAuth: nil,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    init(
        baseURL: String,
        headerAuth: ClientConfig.HeaderAuth? = nil,
        bearerAuth: ClientConfig.BearerAuth? = nil,
        basicAuth: ClientConfig.BasicAuth? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        let config = ClientConfig(
            baseURL: baseURL,
            headerAuth: headerAuth,
            bearerAuth: bearerAuth,
            basicAuth: basicAuth,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
        self.account = AccountClient(config: config)
        self.brand = BrandClient(config: config)
        self.jobs = JobsClient(config: config)
        self.webhooks = WebhooksClient(config: config)
        self.httpClient = HTTPClient(config: config)
    }

    public func crawl(request: Requests.CrawlDto, requestOptions: RequestOptions? = nil) async throws -> JobCreatedResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/crawl",
            body: request,
            requestOptions: requestOptions,
            responseType: JobCreatedResponse.self
        )
    }

    public func extract(request: Requests.ExtractDto, requestOptions: RequestOptions? = nil) async throws -> JobCreatedResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/extract",
            body: request,
            requestOptions: requestOptions,
            responseType: JobCreatedResponse.self
        )
    }

    public func map(request: Requests.MapDto, requestOptions: RequestOptions? = nil) async throws -> MapResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/map",
            body: request,
            requestOptions: requestOptions,
            responseType: MapResponse.self
        )
    }

    public func parse(request: Requests.ParseDto, requestOptions: RequestOptions? = nil) async throws -> ScrapeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/parse",
            body: request,
            requestOptions: requestOptions,
            responseType: ScrapeResponse.self
        )
    }

    public func scrape(request: Requests.ScrapeDto, requestOptions: RequestOptions? = nil) async throws -> ScrapeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/scrape",
            body: request,
            requestOptions: requestOptions,
            responseType: ScrapeResponse.self
        )
    }

    /// Cookie banners, blocking overlays, chat widgets, and lazy loading are handled by default. Every cleanup pass can be controlled per request.
    ///
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func screenshot(request: Requests.ScreenshotDto, requestOptions: RequestOptions? = nil) async throws -> ScrapeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/screenshot",
            body: request,
            requestOptions: requestOptions,
            responseType: ScrapeResponse.self
        )
    }

    public func search(request: Requests.SearchDto, requestOptions: RequestOptions? = nil) async throws -> SearchResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/search",
            body: request,
            requestOptions: requestOptions,
            responseType: SearchResponse.self
        )
    }
}