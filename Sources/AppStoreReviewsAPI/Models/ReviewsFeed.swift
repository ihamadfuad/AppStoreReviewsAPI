//
//  ReviewsFeed.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

struct ReviewsFeed: Decodable {

    let feed: Feed
}

struct Feed: Decodable {

    let id: ID
    let author: Author
    let entry: [Entry]
    let updated: Updated
    let rights: Rights
    let title: Title
    let icon: Icon
    let link: [Link]
}
