[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) ![Issues](https://img.shields.io/github/issues/ihamadfuad/AppStoreReviewsAPI) ![Releases](https://img.shields.io/github/v/release/ihamadfuad/AppStoreReviewsAPI)

# AppStoreReviewsAPI

A Swift 5.6 implementation of iTunes customer reviews. Retrieve customer reviews for your app and display most helpful 
reviews.

## Installation
### Swift Package Manager (SPM)

You can use The Swift Package Manager to install SwiftEmailValidator by adding it to your Package.swift file:

    import PackageDescription

    let package = Package(
        name: "MyApp",
        targets: [],
        dependencies: [
            .Package(url: "https://github.com/ekscrypto/SwiftEmailValidator.git", .upToNextMajor(from: "1.0.0"))
        ]
    )

### Usage

```swift
let appStore = AppStoreReviewsAPI(appID: "310633997") // This app id belongs to WhatsApp
let reviews = try await appStore.reviews()

reviews.feed.entry.forEach {

    print("Rating: ", $0.imRating.label)
    print($0.title.label)
    print($0.content.label)
    print(" +---------------------------------------------------+ ")
}
```
