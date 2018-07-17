//
//  Map.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

enum MapMode: String, Codable {
    case casual, competitive
}

enum MapName: String, Codable {
    case de_cache, de_mirage, de_inferno, de_nuke, de_train
}

enum MapPhase: String, Codable {
    case warmup, live, intermission, gameover
}

struct Map: Codable {
    let mode: String//Mode
    let name: String //could be enum
    let phase: String//Phase
    let round: Int
    let team_t: Team
    let team_ct: Team
    let num_matches_to_win_series: Int
    let current_spectators: Int
    let souvenirs_total: Int
}
