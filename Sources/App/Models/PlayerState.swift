//
//  PlayerState.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

struct PlayerState: Codable {

    let health: Int
    let armor: Int
    let helmet: Bool
    let defusekit: Bool?
    let flashed: Int
    let smoked: Int?
    let burning: Int
    let money: Int
    let round_kills: Int
    let round_killhs: Int
    let equip_value: Int

}
