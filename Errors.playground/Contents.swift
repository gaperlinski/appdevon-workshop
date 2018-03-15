//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum PasswordError: Error {
    case empty
    case short
    case obvious
}

func functionA() {
    do {
        try functionB()
    } catch {
        print("Error")
    }
}

func functionB() throws {
    do {
        try functionC()
    } catch PasswordError.empty {
        print("Empty password")
    }
}

func functionC() throws {
    throw PasswordError.short
}
