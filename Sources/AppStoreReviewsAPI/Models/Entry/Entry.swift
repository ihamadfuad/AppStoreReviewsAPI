//
//  Entry.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

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
















