import Foundation

extension String: Error { }

public struct AppStoreReviewsAPI {

    public enum Sortby: String, Decodable {

        case mostHelpful = "mosthelpful"
        case mostRecent = "mostrecent"
    }

    var appID = String()
    var page: String = "1"
    var sortBy: Sortby = .mostHelpful

    private var url: String?

    public init(appID: String, page: String = "1", sortBy: Sortby = .mostHelpful) {

        self.appID = appID
        self.page = page
        self.sortBy = sortBy

        url = "https://itunes.apple.com/rss/customerreviews/page=" + page + "/id=" + appID + "/sortby=" + sortBy.rawValue + "/json?l=en&cc=gb"
    }

    func reviews() async throws -> ReviewsFeed {

        guard let urlString = url,
              let url = URL(string: urlString)
        else {
            throw "\(#function) Line: \(#line) - URL is nil"
        }

        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url), delegate: nil)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        return try decoder.decode(ReviewsFeed.self, from: data)
    }
}
