//
//  PlayerDetails.swift
//  App
//
//  Created by Kacper Woźniak on 01/06/2018.
//

import Vapor

struct PlayerDetails: Codable {

    let steamid: String?
    let personaname: String?
    let profileurl: String?
    let avatar: String?
    let avatarmedium: String?
    let avatarfull: String?
    let realname: String?
    let loccountrycode: String?

}

struct PlayerDetailsList: Codable, Content {

    let players: [PlayerDetails]

    enum Keys: String, CodingKey {
        case response, players
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self).nestedContainer(keyedBy: Keys.self, forKey: .response)
        players = try container.decode([PlayerDetails].self, forKey: .players)
    }

}
