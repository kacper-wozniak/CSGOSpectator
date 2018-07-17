//
//  Player.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

typealias Weapons = [String: Weapon]

enum PlayerTeam: String, Codable {

    case T, CT

}

struct Player: Codable {

    let steamid: String?
    let clan: String?
    let name: String
    let observer_slot: Int
    let team: PlayerTeam
    let state: PlayerState
    let match_stats: MatchStats
    let weapons: Weapons
    let position: String
    let forward: String

}
