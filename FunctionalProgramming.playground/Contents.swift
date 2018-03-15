//: Playground - noun: a place where people can play

import UIKit

//func lengthOf(strings: [String]) -> [Int] {
//    var result = [Int]()
//
//    for string in strings {
//        result.append(string.count)
//    }
//
//    return result
//}

func lengthOf(strings: [String]) -> [Int] {
    return strings.map{ $0.count }
}

lengthOf(strings: ["Paul", "Is", "The", "...?"])




// Mapping optional

let i: Int? = 10
let j = i.map { $0 * 2 }
print(j)

func fetchUsername(id: Int) -> String? {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let username = fetchUsername(id: 1989)
let formattedUsername = username.map { "Welcome, \($0)!" }


// Flatmap to reduce complexity

let num: String? = "5"
let int = num.flatMap { Int($0) } // vs let int = num.map { Int($0) }

let names = ["Taylor", "Paul", "Greg"]
let count = names.reduce(0) { $0 + $1.count }
print(count)

