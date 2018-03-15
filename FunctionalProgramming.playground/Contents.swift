//: Playground - noun: a place where people can play

import UIKit

func testCapture() -> (() -> Void) {
    var counter = 0
    
    return {
        counter += 1
        print("Counter is now \(counter)")
    }
}

let greetPerson = testCapture()
greetPerson()
greetPerson()
greetPerson()

// Copied closure shares capture list
let greetCopy = greetPerson
greetCopy()
greetPerson()
greetCopy()

// Escaping closures
var queuedClosures: [() -> Void] = []

func queueClosure(_ closure: @escaping () -> Void) {
    queuedClosures.append(closure)
}

// Autoclosure

func printText(_ result: @autoclosure () -> Void) {
    print("Before")
    result()
    print("After")
}

printText(print("Hello"))
