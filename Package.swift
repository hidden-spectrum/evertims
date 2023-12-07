// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EVERTims",
    platforms: [.macOS(.v10_13)],
    products: [
        .executable(
            name: "evertims",
            targets: ["evertims"]
        ),
        .library(
            name: "EvertIMS",
            targets: ["EvertIMS"]
        ),
        .library(
            name: "Evert",
            targets: ["Evert"]
        )
    ],
    
    targets: [
        .executableTarget(
            name: "evertims",
            dependencies: ["EvertIMS"],
            path: "evertims/src",
            sources: ["main.cc"],
            cSettings: [
                .define("__Darwin"),
                .unsafeFlags(["-w"])
            ],
            linkerSettings: [
                .linkedFramework("OpenGL")
            ]
        ),
        .target(
            name: "EvertIMS",
            dependencies: [
                "Evert",
                "OSC"
            ],
            path: "evertims/src",
            sources: [
                "reader.cc",
                "reverbEstimate.cc",
                "socket.cc",
                "solver.cc",
                "writer.cc"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("__Darwin"),
                .unsafeFlags(["-w"])
            ]
        ),
        .target(
            name: "OSC",
            path: "osc/src",
            publicHeadersPath: ".",
            cSettings: [
                .unsafeFlags(["-w"])
            ]
        ),
        .target(
            name: "Evert",
            path: "libevert/src",
            sources: [
                "elBeam.cc",
                "elBSP.cc",
                "elListener.cc",
                "elOrientedPoint.cc",
                "elPathSolution.cc",
                "elPolygon.cc",
                "elRay.cc",
                "elRoom.cc",
                "elSource.cc",
                "elVector.cc",
                "material.cc",
            ],
            publicHeadersPath: ".",
            cSettings: [
                .define("__Darwin"),
                .unsafeFlags(["-w"])
            ]
        ),
    ]
)
