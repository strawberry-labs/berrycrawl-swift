# Berrycrawl Swift SDK

![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-orange.svg)

The official Swift SDK for scraping, crawling, searching, mapping, structured extraction, screenshots, and brand profiles.

[Documentation](https://docs.berrycrawl.com) · [Dashboard](https://berrycrawl.com/app) · [GitHub](https://github.com/strawberry-labs/berrycrawl-swift)

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Reference](#reference)
- [Usage](#usage)
- [Environments](#environments)
- [Errors](#errors)
- [Request Types](#request-types)
- [Advanced](#advanced)
  - [Additional Headers](#additional-headers)
  - [Additional Query String Parameters](#additional-query-string-parameters)
  - [Timeouts](#timeouts)
  - [Custom Networking Client](#custom-networking-client)
- [Contributing](#contributing)

## Requirements

This SDK requires:
- Swift 5.7+
- iOS 15+
- macOS 12+
- tvOS 15+
- watchOS 8+

## Installation

With Swift Package Manager (SPM), add the following to the top-level `dependencies` array within your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/strawberry-labs/berrycrawl-swift.git", from: "0.1.0"),
]
```

## Reference

A full reference for this library is available [here](./reference.md).

## Usage

Set `BERRYCRAWL_API_KEY` to an API key from the [Berrycrawl dashboard](https://berrycrawl.com/app).

```swift
import Berrycrawl
import Foundation

let client = Berrycrawl(apiKey: ProcessInfo.processInfo.environment["BERRYCRAWL_API_KEY"]!)
let page = try await client.scrape(
    request: .init(url: "https://example.com/pricing")
)
```

### Crawl and search

```swift
let job = try await client.crawl(
    request: .init(limit: 50, url: "https://example.com/docs")
)

let results = try await client.search(
    request: .init(limit: 10, query: "best headless browser libraries")
)
```

### Retrieve a brand profile

```swift
let brand = try await client.brand.retrieve(
    request: .init(url: "https://stripe.com")
)
```

### Brand design system

Brand responses include an optional `branding` object for compatibility with older API deployments. When available, it contains the rendered light/dark scheme, semantic colors, typography, spacing, representative input and button styles, and semantic image roles. Use `branding.images.favicon` for the square icon and `branding.images.logo` for the wordmark.

## Environments

This SDK allows you to configure different environments for API requests.

```swift
import Berrycrawl

let client = Berrycrawl(
    apiKey: "YOUR_API_KEY",
    environment: .production
)
```

## Errors

The SDK throws a single error enum for all failures. Client-side issues encoding/decoding failures and network errors use dedicated cases, while non-success HTTP responses are wrapped in an `HTTPError` that exposes the status code, a simple classification and an optional decoded message.

```swift
import Berrycrawl

let client = Berrycrawl(apiKey: "YOUR_API_KEY")

do {
    let response = try await client.brand.retrieve(...)
    // Handle successful response
} catch let error as BerrycrawlError {
    switch error {
    case .httpError(let httpError):
        print("Status code:", httpError.statusCode)
        print("Kind:", httpError.kind)
        print("Message:", httpError.body?.message ?? httpError.localizedDescription)
    case .encodingError(let underlying):
        print("Encoding error:", underlying)
    case .networkError(let underlying):
        print("Network error:", underlying)
    default:
        print("Other client error:", error)
    }
} catch {
    print("Unexpected error:", error)
}
```

## Request Types

The SDK exports all request types as Swift structs. Simply import the SDK module to access them:

```swift
import Berrycrawl

let request = Requests.BrandDto(
    ...
)
```

## Advanced

### Additional Headers

If you would like to send additional headers as part of the request, use the `additionalHeaders` request option.

```swift
try await client.brand.retrieve(..., requestOptions: .init(
    additionalHeaders: [
        "X-Custom-Header": "custom value"
    ]
))
```

### Additional Query String Parameters

If you would like to send additional query string parameters as part of the request, use the `additionalQueryParameters` request option.

```swift
try await client.brand.retrieve(..., requestOptions: .init(
    additionalQueryParameters: [
        "custom_query_param_key": "custom_query_param_value"
    ]
))
```

### Timeouts

The SDK defaults to a 60-second timeout. Use the `timeout` option to configure this behavior.

```swift
try await client.brand.retrieve(..., requestOptions: .init(
    timeout: 30
))
```

### Custom Networking Client

The SDK allows you to customize the underlying `URLSession` used for HTTP requests. Use the `urlSession` option to provide your own configured `URLSession` instance.

```swift
import Foundation
import Berrycrawl

let client = Berrycrawl(
    apiKey: "YOUR_API_KEY",
    urlSession: // Provide your implementation here
)
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!
