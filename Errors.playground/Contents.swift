//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum PasswordError: Error {
    case empty
    case short(minChars: Int)
    case obvious(message: String)
}

func encypt(_ str: String, with password: String) throws -> String {
    if password == "12345" {
        throw PasswordError.obvious(message: "I have the same number on my luggage.")
    }
    let encrypted = password + str + password
    return String(encrypted.reversed())
}

do {
//    let encypted = try encypt("Secret!", with: "T4l0r")
    let encypted = try encypt("Secret!", with: "12345")
    print(encypted)
} catch PasswordError.empty {
    print("You must provide a password")
} catch PasswordError.short(let minChars) where minChars < 8 {
    print("Whe have a moderate security policy: password must be at least \(minChars) characters")
} catch PasswordError.short(let minChars) where minChars < 5 {
    print("Whe have a lax security policy: password must be at least \(minChars) characters")
} catch PasswordError.short(let minChars) {
    print("Whe have a strict security policy: password must be at least \(minChars) characters")
} catch PasswordError.obvious(let message) {
    print("Your password is obvious: \(message)")
} catch {
    print("Encryption failed!")
}
