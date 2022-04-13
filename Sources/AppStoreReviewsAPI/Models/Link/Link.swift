//
//  Link.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

struct Link: Decodable {

    let attributes: Attributes
}

struct Attributes: Decodable {

    let rel: String
    let type: String?
    let href: String
}
