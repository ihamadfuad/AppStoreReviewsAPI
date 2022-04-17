// ºººº----------------------------------------------------------------------ºººº \\
//
// Copyright (c) 2022 Hamad Fuad.
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
// associated documentation files (the "Software"), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial
// portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT
// NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH
// THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// Author: Hamad Fuad
// Email: ihamadfouad@icloud.com
//
// Created At: 13/04/2022
// Last modified: 17/04/2022
//
// ºººº----------------------------------------------------------------------ºººº \\

import Foundation

extension String: Error { }

public struct AppStoreReviewsAPI {

    public enum Sortby: String, Decodable {

        case mostHelpful = "mosthelpful"
        case mostRecent = "mostrecent"
    }

    private var url: String?

    public init(appID: String, page: String = "1", sortBy: Sortby = .mostHelpful) {

        url = "https://itunes.apple.com/rss/customerreviews/page=" + page + "/id=" + appID + "/sortby=" + sortBy.rawValue + "/json?l=en&cc=gb"
    }

    public func reviews() async throws -> ReviewsFeed {

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
