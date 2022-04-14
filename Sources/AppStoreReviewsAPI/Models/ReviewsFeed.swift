//
//  ReviewsFeed.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

public struct ReviewsFeed: Decodable {

    public let feed: Feed
}

public struct Feed: Decodable {

    public let id: ID
    public let author: Author
    public let entry: [Entry]
    public let updated: Updated
    public let rights: Rights
    public let title: Title
    public let icon: Icon
    public let link: [Link]
}
