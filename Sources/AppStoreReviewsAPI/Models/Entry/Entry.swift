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

public struct Entry: Decodable {

    public let author: EntryAuthor
    public let updated: Updated
    public let imRating, imVersion, id: ID
    public let title: Title
    public let content: Content
    public let link: EntryLink
    public let imVoteSum: Vote
    public let imContentType: IMContentType
    public let imVoteCount: Vote

    enum CodingKeys: String, CodingKey {

        case author, updated
        case imRating = "im:rating"
        case imVersion = "im:version"
        case id, title, content, link
        case imVoteSum = "im:voteSum"
        case imContentType = "im:contentType"
        case imVoteCount = "im:voteCount"
    }
}

// MARK: - Author
public struct EntryAuthor: Decodable {

    public let uri, name: ID
    public let label: String
}

// MARK: - Content
public struct Content: Decodable {

    public let label: String
    public let attributes: ContentAttributes
}

// MARK: - ContentAttributes
public struct ContentAttributes: Decodable {

    public let type: TypeEnum
}

public enum TypeEnum: String, Decodable {

    case text = "text"
}

// MARK: - Vote
public struct Vote: Decodable {

    public let label: String
}

// MARK: - IMContentType
public struct IMContentType: Decodable {

    public let attributes: IMContentTypeAttributes
}

// MARK: - IMContentTypeAttributes
public struct IMContentTypeAttributes: Decodable {

    public let term, label: Label
}

public enum Label: String, Decodable {

    case application = "Application"
}

// MARK: - EntryLink
public struct EntryLink: Decodable {

    public let attributes: LinkAttributes
}

// MARK: - LinkAttributes
public struct LinkAttributes: Decodable {

    public let rel: String
    public let href: String
}
