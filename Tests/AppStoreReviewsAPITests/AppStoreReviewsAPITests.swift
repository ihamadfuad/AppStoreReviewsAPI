import XCTest
@testable import AppStoreReviewsAPI

final class AppStoreReviewsAPITests: XCTestCase {

    func testAppStoreReviews() async throws {

        print("Get reviews")

        let appStore = AppStoreReviewsAPI(appID: "310633997")
        let reviews = try await appStore.reviews()

        print("Reviews: ")

        reviews.feed.entry.forEach {

            print("Rating: ", $0.imRating.label)
            print($0.title.label)
            print($0.content.label)
            print(" +---------------------------------------------------+ ")
        }

        XCTAssertGreaterThanOrEqual(reviews.feed.entry.count, 0, "Success")
    }
}
