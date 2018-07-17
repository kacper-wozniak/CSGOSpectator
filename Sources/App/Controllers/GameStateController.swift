//
//  GameStateController.swift
//  App
//
//  Created by Kacper Woźniak on 08/04/2018.
//

import Vapor

final class GameStateController: RouteCollection {

    func boot(router: Router) throws {

        router.post("live") { request -> Future<HTTPStatus> in
            return try request.content.decode(GameState.self).map { gameState -> HTTPStatus in
                try webSockets[gameState.provider.steamid]?.send(JSONEncoder().encode(SimpleGame(with: gameState)))
                return HTTPStatus.ok
            }
        }

        router.get(Int.parameter) { request -> String in
            let id = try request.parameters.next(Int.self)
            return "Game details for id: \(id)"
        }

        router.get("/") { request -> String in
            return "Game summary list"
        }

    }

}
