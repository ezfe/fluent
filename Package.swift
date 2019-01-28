// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "fluent",
    products: [
        .library(name: "Fluent", targets: ["Fluent"]),
        .library(name: "FluentSQL", targets: ["FluentSQL"]),
        .library(name: "FluentBenchmark", targets: ["FluentBenchmark"]),
        .library(name: "FluentPostgresDriver", targets: ["FluentPostgresDriver"]),
        .library(name: "FluentKit", targets: ["FluentKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", .branch("master")),
        .package(url: "https://github.com/vapor/postgresql.git", .branch("2")),
        .package(url: "https://github.com/vapor/sql.git", .branch("3")),
    ],
    targets: [
        .target(name: "Fluent", dependencies: ["FluentKit"]),
        .target(name: "FluentSQL", dependencies: ["FluentKit", "SQLKit"]),
        .target(name: "FluentBenchmark", dependencies: ["FluentKit"]),
        .target(name: "FluentPostgresDriver", dependencies: ["FluentKit", "PostgresKit"]),
        .target(name: "FluentKit", dependencies: ["NIO"]),
        .testTarget(name: "FluentKitTests", dependencies: ["FluentBenchmark"]),
        .testTarget(name: "FluentPostgresDriverTests", dependencies: ["FluentPostgresDriver", "FluentBenchmark"]),
    ]
)
