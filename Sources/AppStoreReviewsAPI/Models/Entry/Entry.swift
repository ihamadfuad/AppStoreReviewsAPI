//
//  Entry.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

struct Entry: Decodable {

    let author: EntryAuthor
    let updated: Updated
    let imRating, imVersion, id: ID
    let title: Title
    let content: Content
    let link: EntryLink
    let imVoteSum: Vote
    let imContentType: IMContentType
    let imVoteCount: Vote

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
struct EntryAuthor: Decodable {

    let uri, name: ID
    let label: String
}

// MARK: - Content
struct Content: Decodable {

    let label: String
    let attributes: ContentAttributes
}

// MARK: - ContentAttributes
struct ContentAttributes: Decodable {

    let type: TypeEnum
}

enum TypeEnum: String, Decodable {

    case text = "text"
}

// MARK: - Vote
struct Vote: Decodable {

    let label: String
}

// MARK: - IMContentType
struct IMContentType: Decodable {

    let attributes: IMContentTypeAttributes
}

// MARK: - IMContentTypeAttributes
struct IMContentTypeAttributes: Decodable {

    let term, label: Label
}

enum Label: String, Decodable {

    case application = "Application"
}

// MARK: - EntryLink
struct EntryLink: Decodable {

    let attributes: LinkAttributes
}

// MARK: - LinkAttributes
struct LinkAttributes: Decodable {

    let rel: String
    let href: String
}
















