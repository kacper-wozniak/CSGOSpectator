//
//  PhaseCountdowns.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 08/04/2018.
//

enum phaseCountdownsPhase: String, Codable {
    case warmup, live, over, freezetime, bomb, defuse, timeout_ct, timeout_t
}

struct PhaseCountdowns: Codable {
    let phase: String//Phase
    let phase_ends_in: String
}
