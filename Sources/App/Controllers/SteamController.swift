//
//  SteamController.swift
//  CSGOSpectatorPackageDescription
//
//  Created by Kacper Woźniak on 21/04/2018.
//

import Vapor
import SendGrid

final class SteamController: RouteCollection {

    func boot(router: Router) throws {

        router.get("players") { request -> Future<PlayerDetailsList> in
            let ids = try request.query.get(String.self, at: "steamids")
            let response = try request.client().get("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=\(Environment.get("STEAM_API_KEY")!)&steamids=\(ids)")
            return response.flatMap { return try $0.content.decode(PlayerDetailsList.self) }
        }

        router.get("config", String.parameter) { request -> Future<HTTPStatus> in
            let address = try request.parameters.next(String.self)
            let client = try request.make(SendGridClient.self)
            let from = EmailAddress(email: "config@csgospectator.com", name: "CSGOSpectator")
            let to = EmailAddress(email: address)
            let content = """
            "CSGOSpectator Configuration"
            {
             "uri" "https://csgospectator.herokuapp.com/api/games/live"
             "timeout" "5.0"
             "buffer"  "1.0"
             "throttle" "1.0"
             "heartbeat" "1.0"
             "data"
             {
               "provider"               "1"
               "map"                    "1"
               "round"                  "1"
               "allplayers_id"          "1"
               "allplayers_state"       "1"
               "allplayers_match_stats" "1"
               "allplayers_weapons"     "1"
               "allplayers_position"    "1"
               "allgrenades"            "1"
               "phase_countdowns"       "1"
             }
            }
            """
            let attachement = EmailAttachment(content: content.data(using: .utf8)?.base64EncodedString(),
                                              type: "text/plain",
                                              filename: "gamestate_integration_csgospectator.cfg",
                                              disposition: "attachment")
            let personalization = Personalization(to: [to], subject: "CSGOSpectator Configuration")
            let email = SendGridEmail(personalizations: [personalization],
                                      from: from,
                                      content: [["type": "text/plain",
                                                 "value": "Hello. Copy an attached configuration file to Steam/steamapps/common/Counter-Strike Global Offensive/csgo/cfg folder."]],
                                      attachments: [attachement])
            return try client.send([email], on: request).transform(to: .ok)
        }

    }

}
