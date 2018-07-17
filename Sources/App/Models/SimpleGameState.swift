//
//  SimpleGameState.swift
//  App
//
//  Created by Kacper Woźniak on 01/06/2018.
//

import Vapor

struct SimpleTeam: Codable {

    let score: Int
    let players: [SimplePlayer]

}

struct SimplePlayer: Codable {

    let steamid: String
    let name: String
    let clan: String?
    let state: PlayerState
    let statistics: MatchStats
    let weapons: [Weapon]
    let position: String
    let forward: String

}

struct SimpleGame: Codable, Content {

    let map: String
    let phase: String
    let phase_ends_in: String
    let round: Int
    let team_ct: SimpleTeam
    let team_t: SimpleTeam

    init(with gameState: GameState) {
        map = gameState.map.name
        phase = gameState.phase_countdowns.phase
        phase_ends_in = gameState.phase_countdowns.phase_ends_in
        round = gameState.map.round + 1
        team_ct = SimpleTeam(score: gameState.map.team_ct.score,
                             players: gameState.allplayers.filter({ arg -> Bool in
                                let (_, player) = arg
                                return player.team == .CT
                             }).map { arg -> SimplePlayer in
                                let (steamid, player) = arg
                                return SimplePlayer(steamid: steamid,
                                                    name: player.name,
                                                    clan: player.clan,
                                                    state: player.state,
                                                    statistics: player.match_stats,
                                                    weapons: player.weapons.map { $0.value },
                                                    position: player.position,
                                                    forward: player.forward)})
        team_t = SimpleTeam(score: gameState.map.team_t.score,
                            players: gameState.allplayers.filter({ arg -> Bool in
                                let (_, player) = arg
                                return player.team == .T
                            }).map { arg -> SimplePlayer in
                                let (steamid, player) = arg
                                return SimplePlayer(steamid: steamid,
                                                    name: player.name,
                                                    clan: player.clan,
                                                    state: player.state,
                                                    statistics: player.match_stats,
                                                    weapons: player.weapons.map { $0.value },
                                                    position: player.position,
                                                    forward: player.forward)})

    }

}
