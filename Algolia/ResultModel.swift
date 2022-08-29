//
//  Modeller.swift
//  Algolia
//
//  Created by Vantage Circle on 23/08/22.
//

import Foundation


// MARK: - ResultModel
struct ResultModel: Codable {
    let id: Int?
    let name: String
    let status: Status
    let species: String?
    let type: String?
    let gender: Gender?
    let origin: Origin?
    let location: Location?
    let image: String
    let episode: [String]?
    let url: String?
    let created: String?
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Origin: Codable {
    let name: String
    let url: String?
}

struct Location: Codable {
    let name: String
    let url: String?
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
