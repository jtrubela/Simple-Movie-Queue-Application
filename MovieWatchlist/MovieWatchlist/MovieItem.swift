//
//  Movie.swift
//  Movies and Cheeseballs
//
//  Created by Justin Trubela on 1/15/22.
//

import Foundation

struct MovieItem: Identifiable, Codable {
    var name: String
    var id = UUID()
}
