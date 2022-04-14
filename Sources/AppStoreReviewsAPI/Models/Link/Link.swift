//
//  Link.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

public struct Link: Decodable {

    public let attributes: Attributes
}

public struct Attributes: Decodable {

    public let rel: String
    public let type: String?
    public let href: String
}
