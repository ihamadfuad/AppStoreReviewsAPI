//
//  Author.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

public struct Author: Decodable {

    public let name, uri: URI
}

public struct URI: Decodable {

    public let label: String
}
