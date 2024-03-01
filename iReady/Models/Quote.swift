//
//  Quote.swift
//  iReady
//
//  Created by Krajg Larson on 3/1/24.
//

import Foundation

struct Quote: Codable {
    var text: String
    var author: String

    var shareMessage: String {
        return "\"\(text)\" — \(author)"
    }
}
