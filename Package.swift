// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "CSGOSpectator",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.3"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0-rc.2"),

        // Sendgrid mailing client
        .package(url: "https://github.com/vapor-community/sendgrid-provider.git", from: "3.0.3")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite", "Vapor", "SendGrid"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

