//
//  Round.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

enum RoundPhase: String, Codable {

    case live, over, freezetime

}

enum RoundBomb: String, Codable {

    case planted, exploded, defused

}

struct Round: Codable {

    let phase: String//Phase //probably more states
    let bomb: String?//RoundBomb
    let win_team: String?//PlayerTeam

}
