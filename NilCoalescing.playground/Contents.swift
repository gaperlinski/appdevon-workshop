//: Playground - noun: a place where people can play

import UIKit

let name: String? = "Talyor"
print(name)

let unwrappedName = name ?? "Anon"
print(unwrappedName)

func returnsOptionalName() -> String? {
    return nil
}

let returnedName = returnsOptionalName() ?? "Anonymous"
print(returnedName)


// long

let savedTextLongWay: String

do {
    savedTextLongWay = try String(contentsOfFile: "saved.txt")
} catch {
    print("Failed to load saved text.")
    savedTextLongWay = "Hello, world!"
}

// short

let savedTextShortWay = try? String(contentsOfFile: "saved.txt") ?? "Hello, world!"

