import FluentSQLite
import Vapor
import SendGrid

var webSockets = [String:WebSocket]()

public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    try services.register(FluentSQLiteProvider())

    let webSocketServer = NIOWebSocketServer.default()
    webSocketServer.get("api", "games", "live", String.parameter) { webSocket, request in
        let id = try request.parameters.next(String.self)
        webSockets[id] = webSocket
        webSocket.onClose.whenSuccess {
            webSockets[id] = nil
        }
    }
    services.register(webSocketServer, as: WebSocketServer.self)

    let config = SendGridConfig(apiKey: Environment.get("SEND_GRID_API_KEY")!)
    services.register(config)
    try services.register(SendGridProvider())

    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    /// middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    let sqlite = try SQLiteDatabase(storage: .memory)

    var databases = DatabasesConfig()
    databases.add(database: sqlite, as: .sqlite)
    services.register(databases)

    let migrations = MigrationConfig()
    services.register(migrations)

}
