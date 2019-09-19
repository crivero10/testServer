import FluentMySQL
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
    // Register providers first
    try services.register(FluentMySQLProvider())

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    // middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
    let db = MySQLDatabase(config: MySQLDatabaseConfig(hostname: "fsm.com.mx", port: 3306, username: "lc068yza9bam", password: "miniso2020$E", database: "todolistapp"))

    // Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: db, as: .mysql)
    services.register(databases)

    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Todo.self, database: .mysql)
    migrations.add(model: Review.self, database: .mysql)
    services.register(migrations)
}
