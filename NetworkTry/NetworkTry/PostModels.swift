//
//  PostModels.swift
//  NetworkTry
//
//  Created by Paarth Parikh on 28/01/24.
//

import Foundation

struct Reply: Codable, Identifiable {
    var id: Int
    var sent: String
    var message: String
}
