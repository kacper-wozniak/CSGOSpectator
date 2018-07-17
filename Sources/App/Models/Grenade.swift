//
//  Grenade.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

enum GrenadeType: String, Codable {

    case flashbang, firebomb, frag, smoke, inferno, decoy

}

struct Grenade: Codable {

    let owner: Int
    let lifetime: String
    let type: GrenadeType
    let position: String?
    let velocity: String?
    let effecttime: String?
    let flames: [String: String]?

}
