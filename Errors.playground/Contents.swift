//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Failure: Error {
    case badNetwork(message: String)
    case broken
}

func definitelyWontThrow() {
    print("Shiny!")
}

try definitelyWontThrow()

func fetchRemote() throws -> String {
    // complicated, failable work
    throw Failure.badNetwork(message: "Firewall blocked port.")
}

func fetchLocal() -> String {
    // this will never throw
    return "Taylor"
}

func fetchUserData(using closure: () throws -> String) rethrows {
    let userData = try closure()
    print ("User data received: \(userData)")
}

do {
    try fetchUserData(using: fetchRemote)
} catch Failure.badNetwork(let message) {
    print(message)
} catch {
    print("Error!")
}

fetchUserData(using: fetchLocal)
