//
//  Author.swift
//  
//
//  Created by Hamad Ali on 13/04/2022.
//

import Foundation

struct Author: Decodable {

    let name, uri: URI
}

struct URI: Decodable {

    let label: String
}
