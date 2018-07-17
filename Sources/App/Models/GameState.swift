//
//  GameState.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 25/01/2018.
//

import Foundation
import Vapor

typealias AllPlayers = [String: Player]
typealias Grenades = [String: Grenade]

struct GameState: Codable {

    let provider: Provider
    let map: Map
    let round: Round?
    let allplayers: AllPlayers
    let phase_countdowns: PhaseCountdowns
    let grenades: Grenades?

}
