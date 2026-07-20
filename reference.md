# Reference
<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">crawl</a>(request: Requests.CrawlDto, requestOptions: RequestOptions?) -> JobCreatedResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.crawl(request: .init(url: "https://example.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CrawlDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">extract</a>(request: Requests.ExtractDto, requestOptions: RequestOptions?) -> JobCreatedResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.extract(request: .init(prompt: "Extract all product names, prices, and descriptions from these pages"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ExtractDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">map</a>(request: Requests.MapDto, requestOptions: RequestOptions?) -> MapResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.map(request: .init(url: "https://example.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.MapDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">parse</a>(request: Requests.ParseDto, requestOptions: RequestOptions?) -> ScrapeResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.parse(request: .init(url: "https://example.com/report.pdf"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ParseDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">scrape</a>(request: Requests.ScrapeDto, requestOptions: RequestOptions?) -> ScrapeResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.scrape(request: .init())
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ScrapeDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">screenshot</a>(request: Requests.ScreenshotDto, requestOptions: RequestOptions?) -> ScrapeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Cookie banners, blocking overlays, chat widgets, and lazy loading are handled by default. Every cleanup pass can be controlled per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.screenshot(request: .init(url: "https://example.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.ScreenshotDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/Berrycrawl.swift">search</a>(request: Requests.SearchDto, requestOptions: RequestOptions?) -> SearchResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.search(request: .init(query: "machine learning tutorials"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.SearchDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Account
<details><summary><code>client.account.<a href="/Sources/Resources/Account/AccountClient.swift">get</a>(requestOptions: RequestOptions?) -> AccountResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.account.get()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Brand
<details><summary><code>client.brand.<a href="/Sources/Resources/Brand/BrandClient.swift">retrieve</a>(request: Requests.BrandDto, requestOptions: RequestOptions?) -> BrandResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Send one website URL. BerryCrawl returns the brand identity found on that site.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.brand.retrieve(request: .init(url: "https://stripe.com"))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.BrandDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Jobs
<details><summary><code>client.jobs.<a href="/Sources/Resources/Jobs/JobsClient.swift">list</a>(type: ListJobsRequestType?, status: ListJobsRequestStatus?, page: Double?, limit: Double?, requestOptions: RequestOptions?) -> ListJobsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.jobs.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**type:** `ListJobsRequestType?` 
    
</dd>
</dl>

<dl>
<dd>

**status:** `ListJobsRequestStatus?` 
    
</dd>
</dl>

<dl>
<dd>

**page:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.jobs.<a href="/Sources/Resources/Jobs/JobsClient.swift">get</a>(id: String, page: Double?, limit: Double?, requestOptions: RequestOptions?) -> JobResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.jobs.get(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**page:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.jobs.<a href="/Sources/Resources/Jobs/JobsClient.swift">cancel</a>(id: String, requestOptions: RequestOptions?) -> CancelJobResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.jobs.cancel(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

## Webhooks
<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">list</a>(requestOptions: RequestOptions?) -> ListWebhooksResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.webhooks.list()
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">create</a>(request: Requests.CreateWebhookDto, requestOptions: RequestOptions?) -> WebhookResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.webhooks.create(request: .init(
        events: [
            "crawl.completed",
            "extract.failed"
        ],
        url: "https://api.example.com/webhooks"
    ))
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**request:** `Requests.CreateWebhookDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">get</a>(id: String, requestOptions: RequestOptions?) -> WebhookResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.webhooks.get(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">delete</a>(id: String, requestOptions: RequestOptions?) -> MessageResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.webhooks.delete(id: "id")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">update</a>(id: String, request: Requests.UpdateWebhookDto, requestOptions: RequestOptions?) -> WebhookResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.webhooks.update(
        id: "id",
        request: .init()
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.UpdateWebhookDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.webhooks.<a href="/Sources/Resources/Webhooks/WebhooksClient.swift">test</a>(id: String, request: Requests.TestWebhookDto, requestOptions: RequestOptions?) -> TestWebhookResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import Berrycrawl

private func main() async throws {
    let client = Berrycrawl(apiKey: "<token>")

    _ = try await client.webhooks.test(
        id: "id",
        request: .init(event: "crawl.completed")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**id:** `String` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.TestWebhookDto` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

