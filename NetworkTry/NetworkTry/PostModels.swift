//
//  PostModels.swift
//  NetworkTry
//
//  Created by Paarth Parikh on 28/01/24.
//

import Foundation

struct Posts: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}
