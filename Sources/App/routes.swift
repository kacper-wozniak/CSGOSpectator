import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {

    try router.grouped("api", "games").register(collection: GameStateController())
    try router.grouped("api", "steam").register(collection: SteamController())

}
